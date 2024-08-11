import Foundation

extension MPVPlayer.Properties {

    /// Duration of the current file in seconds.
    ///
    /// If the duration is unknown, the property is unavailable. Note that the file duration is not always exactly known, so this is an estimate.
    ///
    /// This replaces the length property, which was deprecated after the mpv 0.9 release. (The semantics are the same.)
    @Property.Double
    public static var duration = "duration"

    /// Position in current file (0-100).
    ///
    /// The advantage over using this instead of calculating it out of other properties is that it properly falls back to estimating the playback position from the byte position, if the file duration is not known.
    @Property.Double
    public static var percentPosition = "percent-pos"

    /// Position in current file in seconds.
    @Property.Double
    public static var timePosition = "time-pos"

    /// Remaining length of the file in seconds.
    ///
    /// Note that the file duration is not always exactly known, so this is an estimate.
    @Property.Double
    public static var timeRemaining = "time-remaining"

    /// time-remaining scaled by the current speed.
    @Property.Double
    public static var playtimeRemaining = "playtime-remaining"

    /// Position in current file in seconds.
    ///
    /// Unlike time-pos, the time is clamped to the range of the file.
    ///
    /// Inaccurate file durations etc. could make it go out of range. Useful on attempts to seek outside of the file, as the seek target time is considered the current position during seeking.
    @Property.Double
    public static var playbackTime = "playback-time"

    /// Whether the player is currently seeking, or otherwise trying to restart playback.
    ///
    /// It's possible that it returns yes/true while a file is loaded.
    /// This is because the same underlying code is used for seeking and resyncing.
    @Property.Bool
    public static var seeking = "seeking"
}
