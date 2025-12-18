import Swift2DFCodegen

public struct AnyValue: Expression {
    public let parameterElementType: Swift.String = "any"

    public init(varItem: VarItem) {
        self.varItem = varItem
    }

    public let varItem: any VarItem
}
