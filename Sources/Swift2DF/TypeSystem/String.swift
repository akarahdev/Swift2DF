import Swift2DFCodegen

public struct String: AnyValue, ExpressibleByStringLiteral {
    public init(unicodeScalarLiteral value: Character) {
        self.varItem = StringVarItem(name: Swift.String(value))
    }

    public init(stringLiteral value: Swift.String) {
        self.varItem = StringVarItem(name: value)
    }

    public typealias StringLiteralType = Swift.String

    public typealias ExtendedGraphemeClusterLiteralType = Swift.String

    public typealias UnicodeScalarLiteralType = Swift.Character

    public let varItem: any VarItem
}

extension Swift.String: AnyValue {
    public var varItem: any Swift2DFCodegen.VarItem {
        return StringVarItem(name: self)    
    }
}