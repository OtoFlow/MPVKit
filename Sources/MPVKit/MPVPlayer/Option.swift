import Foundation

extension MPVPlayer {

    public typealias Options = _AnyOption

    public class _AnyOption {

        public let name: String

        public init(name: String) {
            self.name = name
        }
    }

    public protocol OptionType {

        associatedtype Value
    }

    public final class Option<Value>: _AnyOption {

        public init(name: String, type: Value.Type = Void.self) {
            super.init(name: name)
        }
    }
}

@propertyWrapper
public struct Option<T> {

    public let wrappedValue: String

    public let projectedValue: MPVPlayer.Option<T>

    public init(_ name: String) {
        wrappedValue = name
        projectedValue = MPVPlayer.Option(name: name, type: T.self)
    }

    public init(_ name: String, type: T.Type = Void.self) {
        wrappedValue = name
        projectedValue = MPVPlayer.Option(name: name, type: type)
    }

    public init(wrappedValue: String) {
        self.init(wrappedValue)
    }

    public init(wrappedValue: String, type: T.Type = Void.self) {
        self.init(wrappedValue)
    }
}

extension MPVPlayer.Option: PropertyType where Value: ValueConvertible {

}

extension Option {
    public typealias Bool = Option<Swift.Bool>
    public typealias Double = Option<Swift.Double>
}
