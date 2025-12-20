import DFCore

public struct List<T: Expression>: Expression {
    public let parameterElementType: Swift.String = "list"

    public var varItem: any VarItem

    public init() {
        self.varItem = VariableVarItem.generateRandomly()
        appendCodeBlock(
            SelectionBlock.setVar(
                action: "CreateList",
                args: [0: varItem]
            )
        )
    }

    public init(varItem: any VarItem) {
        self.varItem = varItem
    }
}

public extension List {
    subscript(index: Number) -> T {
        set(newValue) {
            appendCodeBlock(
                SelectionBlock.setVar(
                    action: "SetListValue",
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
                    action: "GetListValue",
                    args: [
                        0: variable,
                        1: self.varItem,
                        2: index.varItem
                    ]
                )
            )
            return T(varItem: variable)
        }
    }
}

public extension List {
    func append(_ value: T) {
        appendCodeBlock(
            SelectionBlock.setVar(
                action: "AppendValue",
                args: [
                    0: varItem,
                    1: value.varItem
                ]
            )
        )
    }
}
