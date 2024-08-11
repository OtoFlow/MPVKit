import Foundation
import CoreMedia
import QuartzCore
import Libmpv

open class MPVPlayer: PlayerType {

    var mpv: OpaquePointer!

    lazy var command = Commandant(self)

    public var metalLayer: CAMetalLayer? {
        didSet {
            if metalLayer != nil {
                mpv_set_option(mpv, "wid", MPV_FORMAT_INT64, &metalLayer)
            }
        }
    }

    public var duration: TimeInterval {
        getProperty(.$duration)
    }

    public var remainingTime: TimeInterval {
        getProperty(.$playtimeRemaining)
    }

    public var playbackTime: TimeInterval {
        get { getProperty(.$playbackTime) }
        set { setProperty(.$playbackTime, value: newValue) }
    }

    public var isPaused: Bool {
        getProperty(.PlaybackControl.$pause)
    }

    public var isSeeking: Bool {
        getProperty(.$seeking)
    }

    open weak var delegate: Delegate?

    lazy var queue = DispatchQueue(label: "mpv", qos: .userInitiated)

    public init() {
        setupMpv()
    }

    private func setupMpv() {
        mpv = mpv_create()

        mpv_set_option_string(mpv, "subs-match-os-language", "yes")
        mpv_set_option_string(mpv, "subs-fallback", "yes")
        mpv_set_option_string(mpv, "vo", "gpu-next")
        mpv_set_option_string(mpv, "gpu-api", "vulkan")
        mpv_set_option_string(mpv, "hwdec", "videotoolbox")
        mpv_set_option_string(mpv, "video-rotate", "no")
        mpv_set_option_string(mpv, "ytdl", "no")

        mpv_initialize(mpv)

        observe(property: Options.PlaybackControl.$pause)

        mpv_set_wakeup_callback(mpv, { ctx in
            let player = unsafeBitCast(ctx, to: MPVPlayer.self)
            player.readEvents()
        }, Unmanaged.passUnretained(self).toOpaque())
    }

    public func loadFile(url: URL) {
        command.loadfile(url.absoluteString, "replace")
    }

    public func play() {
        setProperty(.PlaybackControl.$pause, value: false)
    }

    public func pause() {
        setProperty(.PlaybackControl.$pause, value: true)
    }

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

    func handlePropertyChange(_ name: String, _ property: mpv_event_property) {
        switch name {
        case Options.PlaybackControl.pause:
            guard let paused = UnsafePointer<Bool>(OpaquePointer(property.data))?.pointee else {
                break
            }
            delegate?.player(self, stateChanged: paused ? .paused : .playing)
        default: ()
        }
    }

    func handleEvent(_ event: UnsafePointer<mpv_event>) {
        let eventId = event.pointee.event_id

        switch eventId {
        case MPV_EVENT_SHUTDOWN:
            ()
        case MPV_EVENT_LOG_MESSAGE:
            ()
        case MPV_EVENT_COMMAND_REPLY:
            ()
        case MPV_EVENT_START_FILE:
            ()
        case MPV_EVENT_END_FILE:
            ()
        case MPV_EVENT_FILE_LOADED:
            ()
        case MPV_EVENT_PROPERTY_CHANGE:
            let dataOpaquePtr = OpaquePointer(event.pointee.data)
            if let property = UnsafePointer<mpv_event_property>(dataOpaquePtr)?.pointee {
                let propertyName = String(cString: property.name)
                handlePropertyChange(propertyName, property)
            }
        case MPV_EVENT_VIDEO_RECONFIG:
            ()
        case MPV_EVENT_AUDIO_RECONFIG:
            ()
        case MPV_EVENT_SEEK:
            ()
        case MPV_EVENT_PLAYBACK_RESTART:
            ()
        default: ()
        }
    }

    func readEvents() {
        queue.async { [weak self] in
            guard let self else { return }

            while mpv != nil {
                let event = mpv_wait_event(mpv, 0)!
                // Do not deal with mpv-event-none
                if event.pointee.event_id == MPV_EVENT_NONE {
                    break
                }
                handleEvent(event)
            }
        }
    }
}

extension MPVPlayer {

    private func observe<Property: PropertyType>(property: Property) {
        mpv_observe_property(mpv, 0, property.name, Property.Value.mpvFormat)
    }

    private func _getProperty<Property: PropertyType>(_ property: Property) -> Property.Value {
        var data = Property.Value.create()

        _ = withUnsafeMutablePointer(to: &data) { data in
            mpv_get_property(mpv, property.name, Property.Value.mpvFormat, data)
        }

        return Property.Value.toValue(data)
    }

    private func _setProperty<Property: PropertyType>(_ property: Property, value: Property.Value) {
        guard mpv != nil else { return }

        var data = value.rawValue()

        _ = withUnsafeMutablePointer(to: &data) { data in
            mpv_set_property(mpv, property.name, Property.Value.mpvFormat, data)
        }
    }

    public func getProperty<Value>(_ property: Property<Value>) -> Value {
        _getProperty(property)
    }

    public func setProperty<Value>(_ property: Property<Value>, value: Value) {
        _setProperty(property, value: value)
    }

    public func getProperty<Value>(_ property: Option<Value>) -> Value where Value: ValueConvertible {
        _getProperty(property)
    }

    public func setProperty<Value>(_ property: Option<Value>, value: Value) where Value: ValueConvertible {
        _setProperty(property, value: value)
    }
}
