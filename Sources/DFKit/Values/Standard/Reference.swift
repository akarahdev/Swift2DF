import DFCore

public extension Expression {
    func ref() -> Reference<Self> {
        return Reference(varItem: self.varItem)
    }
}

/// Represents a reference to value. You can use `store` to write to the underlying value,
/// or use `unwrap` to get the value inside.
public struct Reference<T: Expression>: Expression {
    public init(varItem: any VarItem) {
        self.varItem = varItem
    }

    public let parameterElementType: Swift.String = "var"

    public var varItem: any VarItem

    @unsafe
    public static func uninitialized() -> Reference<T> {
        return Reference(varItem: VariableVarItem.generateRandomly())
    }
}

public extension Reference {
    func store(_ value: T) {
        appendCodeBlock(
            SelectionBlock.setVar(
                action: "=",
                args: [
                    0 : self.varItem,
                    1 : value.varItem
                ]
            )
        )
    }

    func unwrap() -> T {
        return T(varItem: self.varItem)
    }
}
