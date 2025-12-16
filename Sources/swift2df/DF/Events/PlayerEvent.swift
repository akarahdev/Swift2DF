import Synchronization

public struct PlayerEvent: Action {
    public func compile(blocks: inout [any CodeBlock]) {
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
    }

    let event: String;
    let contents: [Action];

    @resultBuilder
    struct Join {
        static func buildBlock(_ components: Action...) -> PlayerEvent {
            return PlayerEvent(
                event: "Join", 
                contents: components
            )
        }
    }

    @resultBuilder
    struct Quit {
        static func buildBlock(_ components: Action...) -> PlayerEvent {
            return PlayerEvent(
                event: "Leave", 
                contents: components
            )
        }
    }
}