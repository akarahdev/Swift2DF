import DFCore

/// The base type for every DiamondFire type.
/// Should not be used directly by end users, use ``AnyValue`` instead.
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
        if let variable = self.varItem as? VariableVarItem {
            return ("%var(" as Swift.String) + variable.name as Swift.String + (")" as Swift.String)
        } else {
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
}
