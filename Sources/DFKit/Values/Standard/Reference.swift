import DFCore

public extension Expression {
    func ref() -> Reference<Self> {
        return Reference(varItem: self.varItem)
    }
}

public struct Reference<T: Expression>: Expression {
    public init(varItem: any VarItem) {
        self.varItem = varItem
    }

    public let parameterElementType: Swift.String = "var"

    public var varItem: any VarItem

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
