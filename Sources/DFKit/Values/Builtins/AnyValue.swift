import DFCore

/// Represents any value in the DiamondFire type system.
/// Can be casted to other values, and other values can be casted to this.
public struct AnyValue: Expression {

    public let parameterElementType: Swift.String = "any"

    public init(varItem: VarItem) {
        self.varItem = varItem
    }

    public let varItem: any VarItem
}
