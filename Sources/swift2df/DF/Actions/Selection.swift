public struct Selection<K: SelectionKind> {
    
}

public extension Selection<Player> {
    static func defaultPlayer() -> Selection<Player> {
        return Selection<Player>()
    }

    func kick() -> None {
        return PlayerActionExpr(action: "Kick", args: [:])
    }

    func teleport(to loc: Location) -> None {
        return PlayerActionExpr(action: "Teleport", args: [0: loc])
    }

    func sendMessage(message: AnyValue) -> None {
        return PlayerActionExpr(
            action: "SendMessage", 
            args: [
                0: message
            ]
        )
    }
}

public protocol SelectionKind {
    
}
public struct Player: SelectionKind {}
public struct Entity: SelectionKind {}