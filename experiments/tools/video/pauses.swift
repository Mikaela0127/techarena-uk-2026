// List the longest silent pauses in a recording, to find where each section starts.
// Usage: swift pauses.swift <video or audio file> [min pause seconds, default 1.2]
import AVFoundation

let args = CommandLine.arguments
let url = URL(fileURLWithPath: args[1])
let minPause = args.count > 2 ? Double(args[2]) ?? 1.2 : 1.2
let asset = AVURLAsset(url: url)
guard let track = try await asset.loadTracks(withMediaType: .audio).first else { print("no audio track"); exit(1) }
let reader = try AVAssetReader(asset: asset)
let rate = 16000.0
let output = AVAssetReaderTrackOutput(track: track, outputSettings: [
    AVFormatIDKey: kAudioFormatLinearPCM, AVSampleRateKey: rate, AVNumberOfChannelsKey: 1,
    AVLinearPCMBitDepthKey: 32, AVLinearPCMIsFloatKey: true, AVLinearPCMIsNonInterleaved: false,
    AVLinearPCMIsBigEndianKey: false])
reader.add(output)
reader.startReading()

// RMS level per 50 ms window.
let window = Int(rate * 0.05)
var levels: [Float] = [], acc: Float = 0, n = 0
while let buffer = output.copyNextSampleBuffer(), let block = CMSampleBufferGetDataBuffer(buffer) {
    var length = 0
    var pointer: UnsafeMutablePointer<Int8>?
    CMBlockBufferGetDataPointer(block, atOffset: 0, lengthAtOffsetOut: nil, totalLengthOut: &length, dataPointerOut: &pointer)
    let samples = UnsafeRawPointer(pointer!).bindMemory(to: Float.self, capacity: length / 4)
    for i in 0..<(length / 4) {
        acc += samples[i] * samples[i]; n += 1
        if n == window { levels.append((acc / Float(n)).squareRoot()); acc = 0; n = 0 }
    }
}
guard !levels.isEmpty else { print("no audio"); exit(1) }

// Silence = below 15% of the median speech level.
let sorted = levels.sorted()
let threshold = sorted[sorted.count / 2] * 0.15
var pauses: [(start: Double, length: Double)] = []
var runStart: Int? = nil
for (i, level) in levels.enumerated() + [(levels.count, Float.infinity)] {
    if level < threshold { if runStart == nil { runStart = i } }
    else if let s = runStart {
        let length = Double(i - s) * 0.05
        if length >= minPause { pauses.append((Double(s) * 0.05, length)) }
        runStart = nil
    }
}
print(String(format: "duration %.1f s, %d pauses of at least %.1f s", Double(levels.count) * 0.05, pauses.count, minPause))
for p in pauses { print(String(format: "  %7.2f s  (%.1f s pause, cut at %.2f)", p.start, p.length, p.start + p.length / 2)) }
