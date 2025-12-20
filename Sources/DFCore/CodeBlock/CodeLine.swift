public struct CodeLine: JsonConvertible {
    let blocks: [CodeBlock]

    init(blocks: [CodeBlock]) {
        self.blocks = blocks
    }

    public func toJson() -> Json {
        return .object([
            "blocks": .array(
                self.blocks.map() { cb in cb.toJson() }
            )
        ])
    }

    public func getHeader() -> HeaderType {
        guard let val = self.blocks.first else {
            return .empty
        }
        if !(val is SelectionBlock) {
            return .empty
        }
        let block = val as! SelectionBlock
        switch block.block {
            case "event":
                return .playerEvent(event: block.action)
            case "func":
                return .function(data: block.data)
            case _:
                return .empty
        }
    }
}

public enum HeaderType {
    case playerEvent(event: String)
    case entityEvent(event: String)
    case function(data: String)
    case process(data: String)
    case empty
}

@resultBuilder
public struct CodeResultBuilder {
    public static func buildBlock(_ components: CodeBlock...) -> CodeLine {
        return CodeLine(blocks: Array(components))
    }
}
