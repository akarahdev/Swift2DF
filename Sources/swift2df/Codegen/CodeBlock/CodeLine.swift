struct CodeLine: JsonConvertible {
    let blocks: [CodeBlock]

    init(blocks: [CodeBlock]) {
        self.blocks = blocks
    }

    func toJson() -> Json {
        return .object([
            "blocks": .array(
                self.blocks.map() { cb in cb.toJson() }
            )
        ])
    }
}

@resultBuilder
struct CodeResultBuilder {
    static func buildBlock(_ components: CodeBlock...) -> CodeLine {
        return CodeLine(blocks: Array(components))
    }
}