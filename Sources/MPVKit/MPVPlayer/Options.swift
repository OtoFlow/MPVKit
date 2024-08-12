import Foundation

extension MPVPlayer.Options {

    public struct PlaybackControl {

        private init() { }

        /// `--start=<relative time>`
        @Option.Double
        public static var start = "start"

        /// `--end=<relative time>`
        @Option.Double
        public static var end = "end"

        /// `--length=<relative time>`
        @Option.Double
        public static var lenght = "length"

        /// `--rebase-start-time=<yes|no>`
        @Option.Bool
        public static var rebaseStartTime = "rebase-start-time"

        /// `--speed=<0.01-100>`
        @Option.Double
        public static var speed = "speed"

        /// `--pause`
        @Option.Bool
        public static var pause = "pause"

        /// `--shuffle`
        @Option
        public static var shuffle = "shuffle"

        /// `--playlist-start=<auto|index>`
        @Option
        public static var playlistStart = "playlist-start"

        /// `--playlist=<filename>`
        @Option
        public static var playlist = "playlist"

        /// `--chapter-merge-threshold=<number>`
        @Option
        public static var chapterMergeThreshold = "chapter-merge-threshold"

        /// `--chapter-seek-threshold=<seconds>`
        @Option
        public static var chapterSeekThreshold = "chapter-seek-threshold"

        /// `--hr-seek=<no|absolute|yes|default>`
        @Option
        public static var hrSeek = "hr-seek"

        /// `--hr-seek-demuxer-offset=<seconds>`
        @Option
        public static var hrSeekDemuxerOffset = "hr-seek-demuxer-offset"

        /// `--hr-seek-framedrop=<yes|no>`
        @Option
        public static var hrSeekFramedrop = "hr-seek-framedrop"

        /// `--index=<mode>`
        @Option
        public static var index = "index"
        /// `--load-unsafe-playlists`
        @Option
        public static var loadUnsafePlaylists = "load-unsafe-playlists"

        /// `--access-references=<yes|no>`
        @Option
        public static var accessReferences = "access-references"

        /// `--loop-playlist=<N|inf|force|no>`
        @Option
        public static var loopPlaylist = "loop-playlist"

        /// `--loop-file=<N|inf|no>`
        @Option
        public static var loopFile = "loop-file"

        /// `--loop=<N|inf|no>`
        @Option
        public static var loop = "loop"

        /// `--ab-loop-a=<time>`
        @Option
        public static var abLoopA = "ab-loop-a"

        /// `--ab-loop-b=<time>`
        @Option
        public static var abLoopB = "ab-loop-b"

        /// `--ab-loop-count=<N|inf>`
        @Option
        public static var abLoopCount = "ab-loop-count"

        /// `--ordered-chapters=<yes|no>`
        @Option
        public static var orderedChapters = "ordered-chapters"

        /// `--ordered-chapters-files=<playlist-file>`
        @Option
        public static var orderedChaptersFiles = "ordered-chapters-files"

        /// `--chapters-file=<filename>`
        @Option
        public static var chaptersFile = "chapters-file"

        /// `--sstep=<sec>`
        @Option
        public static var sstep = "sstep"

        /// `--stop-playback-on-init-failure=<yes|no>`
        @Option
        public static var stopPlaybackOnInitFailure = "stop-playback-on-init-failure"

        /// `--play-direction=<forward|+|backward|->`
        @Option
        public static var playDirection = "play-direction"

        /// `--video-reversal-buffer=<bytesize>`
        @Option
        public static var videoReversalBuffer = "video-reversal-buffer"

        /// `--audio-reversal-buffer=<bytesize>`
        @Option
        public static var audioReversalBuffer = "audio-reversal-buffer"

        /// `--video-backward-overlap=<auto|number>`
        @Option
        public static var videoBackwardOverlap = "video-backward-overlap"

        /// `--audio-backward-overlap=<auto|number>`
        @Option
        public static var audioBackwardOverlap = "audio-backward-overlap"

        /// `--video-backward-batch=<number>`
        @Option
        public static var videoBackwardBatch = "video-backward-batch"

        /// `--audio-backward-batch=<number>`
        @Option
        public static var audioBackwardBatch = "audio-backward-batch"

        /// `--demuxer-backward-playback-step=<seconds>`
        @Option
        public static var demuxerBackwardPlaybackStep = "demuxer-backward-playback-step"
    }
}
