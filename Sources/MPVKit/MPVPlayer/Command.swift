import Foundation
import Libmpv

extension MPVPlayer {

    public struct Command<T> {

        public let name: String
    }

    @dynamicMemberLookup
    public struct Commandant {

        public struct Executor<Input> {

            private weak var player: MPVPlayer?

            private let command: Command<Input>

            public var name: String {
                command.name
            }

            init(player: MPVPlayer?, command: Command<Input>) {
                self.player = player
                self.command = command
            }

            private func makeCArgs<T>(_ command: Command<T>, _ args: [String?]) -> [String?] {
                var strArgs = args
                strArgs.insert(command.name, at: 0)
                strArgs.append(nil)
                return strArgs
            }

            public func callAsFunction() -> Int32 where Input == Void {
                guard let mpv = player?.mpv else { return -1 }

                var cargs = makeCArgs(command, []).map { $0.flatMap { UnsafePointer<CChar>(strdup($0)) } }

                defer {
                    for case let ptr? in cargs {
                        free(UnsafeMutablePointer(mutating: ptr))
                    }
                }

                return mpv_command(mpv, &cargs)
            }

            public func callAsFunction(_ argument: Input) -> Int32 where Input == String {
                guard let mpv = player?.mpv else { return -1 }

                var cargs = makeCArgs(command, [argument]).map { $0.flatMap { UnsafePointer<CChar>(strdup($0)) } }

                defer {
                    for case let ptr? in cargs {
                        free(UnsafeMutablePointer(mutating: ptr))
                    }
                }

                return mpv_command(mpv, &cargs)
            }

            public func callAsFunction(_ arguments: [String]) -> Int32 where Input == Array<String> {
                guard let mpv = player?.mpv else { return -1 }

                var cargs = makeCArgs(command, arguments).map { $0.flatMap { UnsafePointer<CChar>(strdup($0)) } }

                defer {
                    for case let ptr? in cargs {
                        free(UnsafeMutablePointer(mutating: ptr))
                    }
                }

                return mpv_command(mpv, &cargs)
            }

            public func callAsFunction(_ arguments: String...) -> Int32 where Input == Array<String> {
                self.callAsFunction(arguments)
            }
        }

        private weak var player: MPVPlayer?

        public init(_ player: MPVPlayer) {
            self.player = player
        }

        public subscript<Property, Input>(dynamicMember keyPath: KeyPath<Commands, Property>) -> Executor<Input> where Property == Command<Input> {
            .init(player: player, command: Commands()[keyPath: keyPath])
        }
    }
}

@propertyWrapper
public struct Command<T> {

    public var wrappedValue: MPVPlayer.Command<T>

    public init(_ name: String) {
        self.wrappedValue = .init(name: name)
    }

    public init(_ name: String, type: T.Type = Void.self) {
        self.wrappedValue = .init(name: name)
    }
}

extension Command {
    public typealias Arg = Command<String>
    public typealias Args = Command<[String]>
}
