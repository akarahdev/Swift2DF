public struct Selection<K: SelectionKind> {
    
}

public extension Selection<Player> {
    static func defaultPlayer() -> Selection<Player> {
        return Selection<Player>()
    }

    func kick() -> None {
        return PlayerActionExpr(action: "Kick", args: [:])
    }

    func teleport(_ loc: Location) -> None {
        return PlayerActionExpr(action: "Teleport", args: [0: loc])
    }

    func sendMessage(_ message: AnyValue) -> None {
        return PlayerActionExpr(
            action: "SendMessage", 
            args: [
                0: message,
            ]
        )
        .tagged(slot: 24, tag: "Inherit Styles", option: "True")
        .tagged(slot: 25, tag: "Text Value Merging", option: "Add spaces")
        .tagged(slot: 26, tag: "Alignment Mode", option: "Regular")
    }
}

public protocol SelectionKind {
    
}
public struct Player: SelectionKind {}
public struct Entity: SelectionKind {}