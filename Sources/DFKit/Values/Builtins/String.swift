import DFCore

public struct String: Expression, ExpressibleByStringLiteral {
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

    public typealias StringLiteralType = Swift.String

    public typealias ExtendedGraphemeClusterLiteralType = Swift.String

    public typealias UnicodeScalarLiteralType = Swift.Character

    public let varItem: any VarItem
}
