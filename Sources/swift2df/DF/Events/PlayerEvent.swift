import Synchronization

public struct PlayerEvent: Sendable, Expression {
    public func getVarItem() -> any VarItem {
        return NullVarItem()
    }

    public func compile(cb blocks: inout [any CodeBlock]) {
        blocks.append(SelectionBlock(
            block: "event", 
            action: self.event, 
            target: "",
            attribute: "",
            args: [:]
        ))
        for expr in self.contents {
            _ = expr.compile(cb: &blocks)
        }
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