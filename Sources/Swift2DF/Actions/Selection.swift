import Swift2DFCodegen

public struct Selection<K: SelectionKind>: Expression {
    public let parameterElementType: Swift.String = "list"

    public init(varItem: any VarItem) {
        self.varItem = varItem
    }

    public let varItem: VarItem
}

public protocol SelectionKind {

}
