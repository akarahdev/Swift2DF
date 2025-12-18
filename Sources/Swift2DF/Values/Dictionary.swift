import Swift2DFCodegen

public struct Dictionary<K: Expression, V: Expression>: Expression {
    public let parameterElementType: Swift.String = "dict"

    public var varItem: any VarItem

    public init() {
        self.varItem = VariableVarItem.generateRandomly()
        appendCodeBlock(
            SelectionBlock.setVar(
                action: "CreateDict",
                args: [0: varItem]
            )
        )
    }

    public init(varItem: any VarItem) {
        self.varItem = varItem
    }
}

public extension Dictionary {
    subscript(index: K) -> V {
        set(newValue) {
            appendCodeBlock(
                SelectionBlock.setVar(
                    action: "SetDictValue",
                    args: [
                        0: self.varItem,
                        1: index.varItem,
                        2: newValue.varItem
                    ]
                )
            )
        }
        get {
            let variable = VariableVarItem.generateRandomly()
            appendCodeBlock(
                SelectionBlock.setVar(
                    action: "GetDictValue",
                    args: [
                        0: variable,
                        1: self.varItem,
                        2: index.varItem
                    ]
                )
            )
            return V(varItem: variable)
        }
    }
}
