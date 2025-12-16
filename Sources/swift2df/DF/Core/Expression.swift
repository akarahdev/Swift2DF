public protocol Expression: Sendable {
    func compile(blocks: inout [CodeBlock]) -> VarItem
}