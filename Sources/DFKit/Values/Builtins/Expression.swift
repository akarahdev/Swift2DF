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

    func global() -> Self {
        let variable = VariableVarItem.generateRandomly(scope: "unsaved")
        appendCodeBlock(
            SelectionBlock.setVar(
                action: "=",
                args: [
                    0 : variable,
                    1 : self.varItem
                ]
            )
        )
        return Self(varItem: variable)
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

    public static func == <R: Expression>(lhs: Self, rhs: R) -> Bool {
        let boolean = VariableVarItem.generateRandomly()
        appendCodeBlock(
            SelectionBlock.setVar(
                action: "=", args: [
                    0 : boolean,
                    1 : StringVarItem(name: "false")
                ]
            )
        )
        appendCodeBlock(
            SelectionBlock.ifVar(
                action: "=", args: [
                    0 : lhs.varItem,
                    1 : rhs.varItem
                ]
            )
        )
        appendCodeBlock(BracketBlock.normOpen())
        appendCodeBlock(
            SelectionBlock.setVar(
                action: "=", args: [
                    0 : boolean,
                    1 : StringVarItem(name: "true")
                ]
            )
        )
        appendCodeBlock(BracketBlock.normClose())
        return Bool(varItem: boolean)
    }



    public static func != <R: Expression>(lhs: Self, rhs: R) -> Bool {
        let boolean = VariableVarItem.generateRandomly()
        appendCodeBlock(
            SelectionBlock.setVar(
                action: "=", args: [
                    0 : boolean,
                    1 : StringVarItem(name: "false")
                ]
            )
        )
        appendCodeBlock(
            SelectionBlock.ifVar(
                action: "!=", args: [
                    0 : lhs.varItem,
                    1 : rhs.varItem
                ]
            )
        )
        appendCodeBlock(BracketBlock.normOpen())
        appendCodeBlock(
            SelectionBlock.setVar(
                action: "=", args: [
                    0 : boolean,
                    1 : StringVarItem(name: "true")
                ]
            )
        )
        appendCodeBlock(BracketBlock.normClose())
        return Bool(varItem: boolean)
    }
}
