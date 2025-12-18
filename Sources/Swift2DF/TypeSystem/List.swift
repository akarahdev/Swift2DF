import Swift2DFCodegen

public struct List<T: AnyValue>: AnyValue {

    public var varItem: any VarItem

    public init() {
        self.varItem = VariableVarItem.generateRandomly()
        GENERATED_CODE.append(
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
            GENERATED_CODE.append(
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
            GENERATED_CODE.append(
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
        GENERATED_CODE.append(
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
