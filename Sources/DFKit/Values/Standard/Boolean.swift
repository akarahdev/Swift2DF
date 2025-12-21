import DFCore

/// Represents a value that is either true or false.
/// Branch on this value using `ifThen`.
public struct Bool: Expression, ExpressibleByBooleanLiteral {
    public typealias BooleanLiteralType = Swift.Bool

    public init(booleanLiteral value: BooleanLiteralType) {
        if value {
            self.varItem = StringVarItem(name: "true")
        } else {
            self.varItem = StringVarItem(name: "false")
        }
    }

    public let parameterElementType: Swift.String = "txt"

    public var varItem: any VarItem

    public init(varItem: any VarItem) {
        self.varItem = varItem
    }
}

public extension Bool {
    func ifThen(callable: () -> Void) {
        appendCodeBlock(
            SelectionBlock.ifVar(
                action: "=",
                args: [
                    0 : self.varItem,
                    1 : StringVarItem(name: "true")
                ]
            )
        )
        appendCodeBlock(
            BracketBlock.normOpen()
        )
        callable()
        appendCodeBlock(
            BracketBlock.normClose()
        )
    }
}
