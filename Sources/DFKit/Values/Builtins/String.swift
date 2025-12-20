import DFCore

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

    static func +<E: Expression>(lhs: String, rhs: E) -> String {
        let variable = VariableVarItem.generateRandomly()
        appendCodeBlock(
            SelectionBlock.setVar(
                action: "+",
                args: [
                    0: variable,
                    1: lhs.varItem,
                    2: rhs.varItem
                ]
            )
        )
        return String(varItem: variable)
    }

    func str() -> String {
        return self
    }

    func append<E: Expression>(_ val: E) -> String {
        let variable = VariableVarItem.generateRandomly()
        appendCodeBlock(
            SelectionBlock.setVar(
                action: "+",
                args: [
                    0: variable,
                    1: self.varItem,
                    2: val.varItem
                ]
            )
        )
        return String(varItem: variable)
    }
}
