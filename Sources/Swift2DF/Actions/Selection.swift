import Swift2DFCodegen

public struct Selection<K: SelectionKind>: AnyValue {
    public init(varItem: any VarItem) {
        self.varItem = varItem
    }

    public let varItem: VarItem
}

public protocol SelectionKind {

}
