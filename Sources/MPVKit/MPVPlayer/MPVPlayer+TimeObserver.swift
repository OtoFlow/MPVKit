import Foundation

extension MPVPlayer {

    public func addPeriodicTimeObserver(forInterval interval: TimeInterval, using block: @escaping @Sendable (TimeInterval) -> Void) -> Timer {
        let timer = Timer(timeInterval: interval, repeats: true) { timer in
            block(interval)
        }
        RunLoop.current.add(timer, forMode: .common)
        return timer
    }

    public func removeTimeObserver(_ observer: Timer) {
        observer.invalidate()
    }
}
