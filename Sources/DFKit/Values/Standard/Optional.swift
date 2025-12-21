import DFCore

/// Represents a value that may be empty.
public struct Optional<T: Expression>: Expression {
    public let parameterElementType: Swift.String = "any"

    public var varItem: any VarItem

    public init() {
        self.varItem = VariableVarItem.generateRandomly()
        appendCodeBlock(
            SelectionBlock.setVar(
                action: "CreateList",
                args: [
                    0 : varItem
                ]
            )
        )
    }

    public init(_ value: T) {
        self.varItem = VariableVarItem.generateRandomly()
        appendCodeBlock(
            SelectionBlock.setVar(
                action: "CreateList",
                args: [
                    0 : varItem,
                    1 : value.varItem
                ]
            )
        )
    }

    public init(varItem: any VarItem) {
        self.varItem = varItem
    }
}

public extension Optional {
    func orElse(_ defaultValue: T) -> T {
        let variable = VariableVarItem.generateRandomly()

        appendCodeBlock(
            SelectionBlock.setVar(
                action: "ListLength",
                args: [
                    0 : VariableVarItem(name: "s2df.temp", scope: "line"),
                    1 : self.varItem
                ]
            )
        )
        appendCodeBlock(
            SelectionBlock.setVar(
                action: "GetListValue",
                args: [
                    0 : variable,
                    1 : self.varItem,
                    2 : NumberVarItem(name: "1")
                ]
            )
        )
        appendCodeBlock(
            SelectionBlock.ifVar(
                action: "=",
                args: [
                    0 : VariableVarItem(name: "s2df.temp", scope: "line"),
                    1 : NumberVarItem(name: "0")
                ]
            )
        )
        appendCodeBlock(
            BracketBlock.normOpen()
        )
        appendCodeBlock(
            SelectionBlock.setVar(
                action: "=",
                args: [
                    0 : variable,
                    1 : defaultValue.varItem
                ]
            )
        )
        appendCodeBlock(
            BracketBlock.normClose()
        )

        return T(varItem: variable)
    }

    func unwrap() -> T {
        let ref = T(varItem: self.varItem).ref()

        Function.make(ref) { ref in
            appendCodeBlock(
                SelectionBlock.setVar(
                    action: "ListLength",
                    args: [
                        0 : VariableVarItem(name: "s2df.temp", scope: "line"),
                        1 : self.varItem
                    ]
                )
            )
            appendCodeBlock(
                SelectionBlock.ifVar(
                    action: "=",
                    args: [
                        0 : VariableVarItem(name: "s2df.temp", scope: "line"),
                        1 : NumberVarItem(name: "0")
                    ]
                )
            )
            appendCodeBlock(
                BracketBlock.normOpen()
            )
            panic("Attempted to unwrap an empty Optional value")
            appendCodeBlock(
                BracketBlock.normClose()
            )

            appendCodeBlock(
                SelectionBlock.setVar(
                    action: "GetListValue",
                    args: [
                        0 : VariableVarItem(name: "s2df.temp", scope: "line"),
                        1 : self.varItem,
                        2 : NumberVarItem(name: "1")
                    ]
                )
            )
            ref.store(T(varItem: VariableVarItem(name: "s2df.temp", scope: "line")))
        }
        return ref.unwrap()
    }
}
