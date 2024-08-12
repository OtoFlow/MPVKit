import Foundation

public protocol PlayerType {

    var duration: TimeInterval { get }

    var remainingTime: TimeInterval { get }

    var playbackTime: TimeInterval { get set }

    var isPaused: Bool { get }

    var isSeeking: Bool { get }

    func loadFile(url: URL)

    func play()

    func pause()

    func seek(to seconds: TimeInterval)

    func seek(by seconds: TimeInterval)
}
