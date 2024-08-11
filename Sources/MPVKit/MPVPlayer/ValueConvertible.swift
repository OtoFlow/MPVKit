import Foundation
import Libmpv

public protocol ValueConvertible {

    associatedtype Raw

    static var mpvFormat: mpv_format { get }

    static func create() -> Raw

    static func toValue(_ rawValue: Raw) -> Self

    func rawValue() -> Raw
}

extension Bool: ValueConvertible {

    public static var mpvFormat = MPV_FORMAT_FLAG

    public static func create() -> Int {
        .zero
    }

    public static func toValue(_ rawValue: Int) -> Bool {
        rawValue > 0
    }

    public func rawValue() -> Int {
        self ? 1 : 0
    }
}

extension Int: ValueConvertible {

    public static var mpvFormat = MPV_FORMAT_INT64

    public static func create() -> Int64 {
        .zero
    }

    public static func toValue(_ rawValue: Int64) -> Int {
        Int(rawValue)
    }

    public func rawValue() -> Int64 {
        Int64(self)
    }
}

extension Double: ValueConvertible {

    public static var mpvFormat = MPV_FORMAT_DOUBLE

    public static func create() -> Double {
        .zero
    }

    public static func toValue(_ rawValue: Double) -> Double {
        rawValue
    }

    public func rawValue() -> Double {
        self
    }
}
