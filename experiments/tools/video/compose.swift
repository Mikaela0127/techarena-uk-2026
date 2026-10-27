// Compose presentation.mp4: full-screen slides with the speaker's camera in the bottom-right corner.
// The speaker's audio is the soundtrack. Each slide is shown for the duration of its camera segment.
// Usage: swift compose.swift <slides.json> <out.mp4> <segment> [<segment> ...]
//   segment = <video file>[@<start seconds>-<end seconds>]; give one segment per slide, in slide order.
//   Without @..., the whole file is used. "end" may be omitted, as in clip.mov@12.5- for "to the end".
import AVFoundation
import AppKit

setvbuf(stdout, nil, _IONBF, 0)
let width = 1280, height = 720
let boxMargin: CGFloat = 24

struct Slide: Decodable { let title: String; let bullets: [String] }

let args = CommandLine.arguments
guard args.count >= 4 else { print("usage: compose.swift slides.json out.mp4 segment..."); exit(2) }
let slides = try JSONDecoder().decode([Slide].self, from: Data(contentsOf: URL(fileURLWithPath: args[1])))
let outURL = URL(fileURLWithPath: args[2])
let segmentSpecs = Array(args[3...])
guard segmentSpecs.count == slides.count else {
    print("need \(slides.count) segments, one per slide; got \(segmentSpecs.count)"); exit(2)
}

// MARK: - Slide rendering

func render(_ slide: Slide) -> CVPixelBuffer {
    var buffer: CVPixelBuffer?
    CVPixelBufferCreate(nil, width, height, kCVPixelFormatType_32ARGB,
                        [kCVPixelBufferCGImageCompatibilityKey: true,
                         kCVPixelBufferCGBitmapContextCompatibilityKey: true] as CFDictionary, &buffer)
    let pb = buffer!
    CVPixelBufferLockBaseAddress(pb, [])
    let ctx = CGContext(data: CVPixelBufferGetBaseAddress(pb), width: width, height: height,
                        bitsPerComponent: 8, bytesPerRow: CVPixelBufferGetBytesPerRow(pb),
                        space: CGColorSpaceCreateDeviceRGB(),
                        bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue)!
    ctx.setFillColor(CGColor(red: 0.07, green: 0.09, blue: 0.14, alpha: 1))
    ctx.fill(CGRect(x: 0, y: 0, width: width, height: height))
    ctx.setFillColor(CGColor(red: 0.35, green: 0.62, blue: 0.98, alpha: 1))
    ctx.fill(CGRect(x: 80, y: height - 140, width: 120, height: 6))
    NSGraphicsContext.current = NSGraphicsContext(cgContext: ctx, flipped: false)
    let title: [NSAttributedString.Key: Any] = [.font: NSFont.boldSystemFont(ofSize: 40), .foregroundColor: NSColor.white]
    NSAttributedString(string: slide.title, attributes: title)
        .draw(in: CGRect(x: 80, y: height - 125, width: width - 160, height: 60))
    // Bullets stay left of the camera box on the right.
    let textWidth = CGFloat(width) - 100 - 440
    let body: [NSAttributedString.Key: Any] = [.font: NSFont.systemFont(ofSize: 27),
                                              .foregroundColor: NSColor(white: 0.9, alpha: 1)]
    var y = CGFloat(height - 200)
    for bullet in slide.bullets {
        let text = NSAttributedString(string: "\u{2022}  " + bullet, attributes: body)
        let box = text.boundingRect(with: CGSize(width: textWidth, height: 400), options: [.usesLineFragmentOrigin])
        text.draw(with: CGRect(x: 100, y: y - box.height + 32, width: textWidth, height: box.height),
                  options: [.usesLineFragmentOrigin])
        y -= box.height + 18
    }
    if y < 20 { print("warning: slide '\(slide.title)' overflows the frame") }
    NSGraphicsContext.current = nil
    CVPixelBufferUnlockBaseAddress(pb, [])
    return pb
}

// MARK: - Camera segments

struct Segment { let asset: AVURLAsset; let range: CMTimeRange }

func parse(_ spec: String) async throws -> Segment {
    let parts = spec.split(separator: "@", maxSplits: 1).map(String.init)
    let asset = AVURLAsset(url: URL(fileURLWithPath: parts[0]))
    let duration = try await asset.load(.duration)
    var start = CMTime.zero, end = duration
    if parts.count == 2 {
        let bounds = parts[1].split(separator: "-", omittingEmptySubsequences: false).map(String.init)
        if let s = Double(bounds[0]) { start = CMTime(seconds: s, preferredTimescale: 600) }
        if bounds.count > 1, let e = Double(bounds[1]) { end = min(CMTime(seconds: e, preferredTimescale: 600), duration) }
    }
    guard end > start else { print("empty segment: \(spec)"); exit(2) }
    return Segment(asset: asset, range: CMTimeRange(start: start, end: end))
}

var segments: [Segment] = []
for spec in segmentSpecs { segments.append(try await parse(spec)) }

// MARK: - 1. Silent slide track, one slide per segment

let silentURL = outURL.deletingLastPathComponent().appendingPathComponent("slides-silent.mov")
try? FileManager.default.removeItem(at: silentURL)
let writer = try AVAssetWriter(outputURL: silentURL, fileType: .mov)
let input = AVAssetWriterInput(mediaType: .video, outputSettings: [
    AVVideoCodecKey: AVVideoCodecType.h264, AVVideoWidthKey: width, AVVideoHeightKey: height])
let adaptor = AVAssetWriterInputPixelBufferAdaptor(assetWriterInput: input, sourcePixelBufferAttributes: nil)
writer.add(input)
writer.startWriting()
writer.startSession(atSourceTime: .zero)
var t = CMTime.zero
for (i, slide) in slides.enumerated() {
    let frame = render(slide)
    let end = t + segments[i].range.duration
    var ft = t
    // One frame per second is enough for a static slide.
    while ft < end {
        while !input.isReadyForMoreMediaData { usleep(1000) }
        adaptor.append(frame, withPresentationTime: ft)
        ft = ft + CMTime(value: 1, timescale: 1)
    }
    t = end
}
input.markAsFinished()
writer.endSession(atSourceTime: t)
await writer.finishWriting()
let total = t

// MARK: - 2. Composition: slides underneath, camera on top, camera audio

let comp = AVMutableComposition()
let slideTrack = comp.addMutableTrack(withMediaType: .video, preferredTrackID: kCMPersistentTrackID_Invalid)!
// Keep the asset alive: its tracks become invalid once it is released.
let slideAsset = AVURLAsset(url: silentURL)
let slideSource = try await slideAsset.loadTracks(withMediaType: .video)[0]
// The written track can end slightly before `total`; insert what exists and stretch it to fit.
let slideRange = try await slideSource.load(.timeRange)
try slideTrack.insertTimeRange(slideRange, of: slideSource, at: .zero)
slideTrack.scaleTimeRange(CMTimeRange(start: .zero, duration: slideRange.duration), toDuration: total)
let camTrack = comp.addMutableTrack(withMediaType: .video, preferredTrackID: kCMPersistentTrackID_Invalid)!
let audioTrack = comp.addMutableTrack(withMediaType: .audio, preferredTrackID: kCMPersistentTrackID_Invalid)!

let camLayer = AVMutableVideoCompositionLayerInstruction(assetTrack: camTrack)
var at = CMTime.zero
for seg in segments {
    let v = try await seg.asset.loadTracks(withMediaType: .video)[0]
    try camTrack.insertTimeRange(seg.range, of: v, at: at)
    if let a = try await seg.asset.loadTracks(withMediaType: .audio).first {
        try audioTrack.insertTimeRange(seg.range, of: a, at: at)
    }
    // Orient the clip, scale it into the corner box and anchor it bottom-right.
    let natural = try await v.load(.naturalSize)
    let pt = try await v.load(.preferredTransform)
    let oriented = CGRect(origin: .zero, size: natural).applying(pt)
    let portrait = oriented.height > oriented.width
    let scale = portrait ? 300 / oriented.height : 380 / oriented.width
    let boxW = oriented.width * scale, boxH = oriented.height * scale
    let transform = pt
        .concatenating(CGAffineTransform(translationX: -oriented.minX, y: -oriented.minY))
        .concatenating(CGAffineTransform(scaleX: scale, y: scale))
        .concatenating(CGAffineTransform(translationX: CGFloat(width) - boxW - boxMargin,
                                         y: CGFloat(height) - boxH - boxMargin))
    camLayer.setTransform(transform, at: at)
    at = at + seg.range.duration
}

let instruction = AVMutableVideoCompositionInstruction()
instruction.timeRange = CMTimeRange(start: .zero, duration: total)
instruction.layerInstructions = [camLayer, AVMutableVideoCompositionLayerInstruction(assetTrack: slideTrack)]
let videoComposition = AVMutableVideoComposition()
videoComposition.renderSize = CGSize(width: width, height: height)
videoComposition.frameDuration = CMTime(value: 1, timescale: 30)
videoComposition.instructions = [instruction]

try? FileManager.default.removeItem(at: outURL)
let export = AVAssetExportSession(asset: comp, presetName: AVAssetExportPreset1280x720)!
export.videoComposition = videoComposition
export.outputURL = outURL
export.outputFileType = .mp4
await export.export()
if export.status != .completed { print("export failed:", export.error ?? "unknown"); exit(1) }
let size = (try FileManager.default.attributesOfItem(atPath: outURL.path)[.size] as? Int) ?? 0
print(String(format: "wrote %@ (%.1f s, %.1f MB)", outURL.path, total.seconds, Double(size) / 1e6))
