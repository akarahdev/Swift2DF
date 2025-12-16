public struct Selection<K: SelectionKind> {
    
}

public extension Selection<Player> {
    static func defaultPlayer() -> Selection<Player> {
        return Selection<Player>()
    }

    func kick() -> Expression<Void> {
        return Expression.init(
            compile: { cb in 
                cb.append(SelectionBlock(
                    block: "player_action",
                    action: "Kick", 
                    target: "",
                    attribute: "",
                    args: [:]
                ))
            }, 
            getVarItem: { () in 
                NullVarItem() 
            }
        )
    }

    func teleport() -> Expression<Void> {
        return Expression.init(
            compile: { cb in 
                cb.append(SelectionBlock(
                    block: "player_action",
                    action: "Kick", 
                    target: "",
                    attribute: "",
                    args: [:]
                ))
            }, 
            getVarItem: { () in 
                NullVarItem() 
            }
        )
    }
}

public protocol SelectionKind {
    
}
public struct Player: SelectionKind {}
public struct Entity: SelectionKind {}