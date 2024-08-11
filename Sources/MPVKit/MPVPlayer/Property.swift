import Foundation

extension MPVPlayer {

    public typealias Properties = _AnyProperty

    public class _AnyProperty {

        public let name: String

        public init(name: String) {
            self.name = name
        }
    }

    public final class Property<Value: ValueConvertible>: _AnyProperty, PropertyType {

        public init(name: String, type: Value.Type) {
            super.init(name: name)
        }
    }
}

@propertyWrapper
public struct Property<T: ValueConvertible> {

    public let wrappedValue: String

    public let projectedValue: MPVPlayer.Property<T>

    public init(_ name: String) {
        wrappedValue = name
        projectedValue = MPVPlayer.Property(name: name, type: T.self)
    }

    public init(wrappedValue: String) {
        self.init(wrappedValue)
    }
}

extension Property {
    public typealias Bool = Property<Swift.Bool>
    public typealias Double = Property<Swift.Double>
}
