import DFCore

/// Represents numbers such as 0. They can be integers or deccimals.
/// Note each number has a fixed-point 3-decimal representation, so 0.0003 gets rounded to 0.
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
