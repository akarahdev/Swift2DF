public struct Selection<K: SelectionKind> {
    
}

public extension Selection<Player> {
    static func defaultPlayer() -> Selection<Player> {
        return Selection<Player>()
    }

    func kick() -> Expression {
        return SelectionBlockExpr(
            block: "player_action",
            action: "Kick", 
            target: "",
            attribute: "",
            args: [:]
        )
    }
}

public protocol SelectionKind {
    
}
public struct Player: SelectionKind {}
public struct Entity: SelectionKind {}