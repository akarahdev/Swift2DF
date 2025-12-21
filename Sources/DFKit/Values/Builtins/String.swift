import DFCore

/// Represents any series of characters, such as "Hello!".
public struct String: Expression, ExpressibleByStringLiteral, ExpressibleByStringInterpolation {
    public let parameterElementType: Swift.String = "txt"

    public init(unicodeScalarLiteral value: Character) {
        self.varItem = StringVarItem(name: Swift.String(value))
    }

    public init(stringLiteral value: Swift.String) {
        self.varItem = StringVarItem(name: value)
    }

    public init(varItem: any VarItem) {
        self.varItem = varItem
    }

    public init(_ value: Swift.String) {
        self.varItem = StringVarItem(name: value)
    }

    public typealias StringLiteralType = Swift.String

    public typealias ExtendedGraphemeClusterLiteralType = Swift.String

    public typealias UnicodeScalarLiteralType = Swift.Character

    public let varItem: any VarItem
}
