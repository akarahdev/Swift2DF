import Synchronization

public struct PlayerEvent: Sendable {
    public func compile(blocks: inout [any CodeBlock]) -> VarItem {
        blocks.append(SelectionBlock(
            block: "event", 
            action: self.event, 
            target: "",
            attribute: "",
            args: [:]
        ))
        for expr in self.contents {
            _ = expr.compile(&blocks)
        }
        return NullVarItem()
    }

    let event: String;
    let contents: [Expression<Void>];

    @resultBuilder
    struct Join {
        static func buildBlock(_ components: Expression<Void>...) -> PlayerEvent {
            return PlayerEvent(
                event: "Join", 
                contents: components
            )
        }
    }

    @resultBuilder
    struct Quit {
        static func buildBlock(_ components: Expression<Void>...) -> PlayerEvent {
            return PlayerEvent(
                event: "Leave", 
                contents: components
            )
        }
    }
}