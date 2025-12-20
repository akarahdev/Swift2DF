import DFCore

public protocol Expression: Sendable, CustomStringConvertible {
    init(varItem: VarItem)

    var varItem: VarItem { get }
    var parameterElementType: Swift.String { get }
}

public extension Expression {
    func asType<T: Expression>(_ ty: T.Type) -> T {
        return T(varItem: self.varItem)
    }
}

extension Expression {
    public var description: Swift.String {
        let variable = VariableVarItem.generateRandomly()
        appendCodeBlock(
            SelectionBlock.setVar(
                action: "=",
                args: [
                    0: variable,
                    1: self.varItem
                ]
            )
        )
        return ("%var(" as Swift.String) + variable.name as Swift.String + (")" as Swift.String)
    }
}
