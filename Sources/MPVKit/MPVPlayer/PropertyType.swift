import Foundation

public protocol PropertyType {

    associatedtype Value: ValueConvertible

    var name: String { get }
}
