public protocol Expression: Sendable {
    func compile(cb: inout [CodeBlock])
    func getVarItem() -> VarItem
}