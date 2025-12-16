public protocol Expression: Action {
    func compile(blocks: inout [CodeBlock]) -> VarItem
}