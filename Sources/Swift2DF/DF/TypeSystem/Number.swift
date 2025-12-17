public struct Number: AnyValue, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
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