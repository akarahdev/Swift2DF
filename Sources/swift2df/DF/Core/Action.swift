public protocol Action: Sendable {
    func compile(blocks: inout [CodeBlock])
}