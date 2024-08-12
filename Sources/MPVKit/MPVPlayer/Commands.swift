import Foundation

/// https://mpv.io/manual/stable/#list-of-input-commands

public struct Commands {

    /// `ignore`
    @Command("ignore")
    public var ignore

    /// `seek <target> [<flags>]`
    @Command.Args("seek")
    public var seek

    /// `revert-seek [<flags>]`
    @Command.Args("revert-seek")
    public var revertSeek

    /// `frame-step`
    @Command("frame-step")
    public var frameStep

    /// `frame-back-step`
    @Command("frame-back-step")
    public var frameBackStep

    /// `set <name> <value>`
    @Command.Args("set")
    public var set

    /// `del <name>`
    @Command.Arg("del")
    public var del

    /// `add <name> [<value>]`
    @Command.Args("add")
    public var add

    /// `cycle <name> [<value>]`
    @Command.Args("cycle")
    public var cycle

    /// `multiply <name> <value>`
    @Command.Args("multiply")
    public var multiply

    /// `screenshot <flags>`
    @Command.Args("screenshot")
    public var screenshot

    /// `screenshot-to-file <filename> <flags>`
    @Command.Args("screenshot-to-file")
    public var screenshotToFile

    /// `playlist-next <flags>`
    @Command.Args("playlist-next")
    public var playlistNext

    /// `playlist-prev <flags>`
    @Command.Args("playlist-prev")
    public var playlistPrev

    /// `playlist-next-playlist`
    @Command("playlist-next-playlist")
    public var playlistNextPlaylist

    /// `playlist-prev-playlist`
    @Command("playlist-prev-playlist")
    public var playlistPrevPlaylist

    /// `playlist-play-index <integer|current|none>`
    @Command.Arg("playlist-play-index")
    public var playlistPlayIndex

    /// `loadfile <url> [<flags> [<index> [<options>]]]`
    @Command.Args("loadfile")
    public var loadfile

    /// `loadlist <url> [<flags> [<index>]]`
    @Command.Args("loadlist")
    public var loadlist

    /// `playlist-clear`
    @Command("playlist-clear")
    public var playlistClear

    /// `playlist-remove <index>`
    @Command.Arg("playlist-remove")
    public var playlistRemove

    /// `playlist-move <index1> <index2>`
    @Command.Args("playlist-move")
    public var playlistMove

    /// `playlist-shuffle`
    @Command("playlist-shuffle")
    public var playlistShuffle

    /// `playlist-unshuffle`
    @Command("playlist-unshuffle")
    public var playlistUnshuffle

    /// `run <command> [<arg1> [<arg2> [...]]]`
    @Command.Args("run")
    public var run

    /// `subprocess`
    @Command("subprocess")
    public var subprocess

    /// `quit [<code>]`
    @Command.Args("quit")
    public var quit

    /// `quit-watch-later [<code>]`
    @Command.Args("quit-watch-later")
    public var quitWatchLater

    /// `sub-add <url> [<flags> [<title> [<lang>]]]`
    @Command.Args("sub-add")
    public var subAdd

    /// `sub-remove [<id>]`
    @Command.Args("sub-remove")
    public var subRemove

    /// `sub-reload [<id>]`
    @Command.Args("sub-reload")
    public var subReload

    /// `sub-step <skip> <flags>`
    @Command.Args("sub-step")
    public var subStep

    /// `sub-seek <skip> <flags>`
    @Command.Args("sub-seek")
    public var subSeek

    /// `print-text <text>`
    @Command.Arg("print-text")
    public var printText

    /// `show-text <text> [<duration>|-1 [<level>]]`
    @Command.Args("show-text")
    public var showText

    /// `expand-text <string>`
    @Command.Arg("expand-text")
    public var expandText

    /// `expand-path "<string>"`
    @Command.Arg("expand-path")
    public var expandPath

    /// `show-progress`
    @Command("show-progress")
    public var showProgress

    /// `write-watch-later-config`
    @Command("write-watch-later-config")
    public var writeWatchLaterConfig

    /// `delete-watch-later-config [<filename>]`
    @Command.Args("delete-watch-later-config")
    public var deleteWatchLaterConfig

    /// `stop [<flags>]`
    @Command.Args("stop")
    public var stop

    /// `mouse <x> <y> [<button> [<mode>]]`
    @Command.Args("mouse")
    public var mouse

    /// `keypress <name> [<scale>]`
    @Command.Args("keypress")
    public var keypress

    /// `keydown <name>`
    @Command.Arg("keydown")
    public var keydown

    /// `keyup [<name>]`
    @Command.Args("keyup")
    public var keyup

    /// `keybind <name> <command>`
    @Command.Args("keybind")
    public var keybind

    /// `audio-add <url> [<flags> [<title> [<lang>]]]`
    @Command.Args("audio-add")
    public var audioAdd

    /// `audio-remove [<id>]`
    @Command.Args("audio-remove")
    public var audioRemove

    /// `audio-reload [<id>]`
    @Command.Args("audio-reload")
    public var audioReload

    /// `video-add <url> [<flags> [<title> [<lang> [<albumart>]]]]`
    @Command.Args("video-add")
    public var videoAdd

    /// `video-remove [<id>]`
    @Command.Args("video-remove")
    public var videoRemove

    /// `video-reload [<id>]`
    @Command.Args("video-reload")
    public var videoReload

    /// `rescan-external-files [<mode>]`
    @Command.Args("rescan-external-files")
    public var rescanExternalFiles

    /// `context-menu`
    @Command("context-menu")
    public var contextMenu

    /// `af <operation> <value>`
    @Command.Args("af")
    public var af

    /// `vf <operation> <value>`
    @Command.Args("vf")
    public var vf

    /// `cycle-values [<"!reverse">] <property> <value1> [<value2> [...]]`
    @Command.Args("cycle-values")
    public var cycleValues

    /// `enable-section <name> [<flags>]`
    @Command.Args("enable-section")
    public var enableSection

    /// `disable-section <name>`
    @Command.Arg("disable-section")
    public var disableSection

    /// `define-section <name> <contents> [<flags>]`
    @Command.Args("define-section")
    public var defineSection

    /// `overlay-add <id> <x> <y> <file> <offset> <fmt> <w> <h> <stride> <dw> <dh>`
    @Command.Args("overlay-add")
    public var overlayAdd

    /// `overlay-remove <id>`
    @Command.Arg("overlay-remove")
    public var overlayRemove

    /// `osd-overlay`
    @Command("osd-overlay")
    public var osdOverlay

    /// `escape-ass <text>`
    @Command.Arg("escape-ass")
    public var escapeAss

    /// `script-message [<arg1> [<arg2> [...]]]`
    @Command.Args("script-message")
    public var scriptMessage

    /// `script-message-to <target> [<arg1> [<arg2> [...]]]`
    @Command.Args("script-message-to")
    public var scriptMessageTo

    /// `script-binding <name>`
    @Command.Arg("script-binding")
    public var scriptBinding

    /// `ab-loop`
    @Command("ab-loop")
    public var abLoop

    /// `drop-buffers`
    @Command("drop-buffers")
    public var dropBuffers

    /// `screenshot-raw [<flags>]`
    @Command.Args("screenshot-raw")
    public var screenshotRaw

    /// `vf-command <label> <command> <argument> [<target>]`
    @Command.Args("vf-command")
    public var vfCommand

    /// `af-command <label> <command> <argument> [<target>]`
    @Command.Args("af-command")
    public var afCommand

    /// `apply-profile <name> [<mode>]`
    @Command.Args("apply-profile")
    public var applyProfile

    /// `load-config-file <filename>`
    @Command.Arg("load-config-file")
    public var loadConfigFile

    /// `load-input-conf <filename>`
    @Command.Arg("load-input-conf")
    public var loadInputConf

    /// `load-script <filename>`
    @Command.Arg("load-script")
    public var loadScript

    /// `change-list <name> <operation> <value>`
    @Command.Args("change-list")
    public var changeList

    /// `dump-cache <start> <end> <filename>`
    @Command.Args("dump-cache")
    public var dumpCache

    /// `ab-loop-dump-cache <filename>`
    @Command.Arg("ab-loop-dump-cache")
    public var abLoopDumpCache

    /// `ab-loop-align-cache`
    @Command("ab-loop-align-cache")
    public var abLoopAlignCache

    /// `begin-vo-dragging`
    @Command("begin-vo-dragging")
    public var beginVoDragging
}
