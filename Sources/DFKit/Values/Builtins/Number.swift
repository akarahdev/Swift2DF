import DFCore

public struct Number: Expression, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    public let parameterElementType: Swift.String = "num"

    public init(varItem: any DFCore.VarItem) {
        self.varItem = varItem
    }

    public init(integerLiteral value: Int) {
        self.varItem = NumberVarItem(name: Swift.String(value))
    }

    public init(floatLiteral value: Float) {
        self.varItem = NumberVarItem(name: Swift.String(value))
    }

    public typealias IntegerLiteralType = Int

    public typealias FloatLiteralType = Float

    public let varItem: any VarItem
}
