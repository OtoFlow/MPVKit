import Foundation

public struct Commands {

    @Command.Args("set")
    public var set

    @Command.Args("loadfile")
    public var loadfile

    @Command("quit")
    public var quit
}
