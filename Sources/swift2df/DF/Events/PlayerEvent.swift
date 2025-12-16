import Synchronization

public struct PlayerEvent: Expression {
    public func compile(blocks: inout [any CodeBlock]) -> VarItem {
        blocks.append(SelectionBlock(
            block: "event", 
            action: self.event, 
            target: "",
            attribute: "",
            args: [:]
        ))
        for expr in self.contents {
            _ = expr.compile(blocks: &blocks)
        }
        return NullVarItem()
    }

    let event: String;
    let contents: [Expression];

    @resultBuilder
    struct Join {
        static func buildBlock(_ components: Expression...) -> PlayerEvent {
            return PlayerEvent(
                event: "Join", 
                contents: components
            )
        }
    }

    @resultBuilder
    struct Quit {
        static func buildBlock(_ components: Expression...) -> PlayerEvent {
            return PlayerEvent(
                event: "Leave", 
                contents: components
            )
        }
    }
}