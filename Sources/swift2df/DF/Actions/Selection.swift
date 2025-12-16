public struct Selection<K: SelectionKind> {
    
}

public extension Selection<Player> {
    static func defaultPlayer() -> Selection<Player> {
        return Selection<Player>()
    }

    func kick() {
        GENERATED_CODE.append(
            SelectionBlock(
                block: "player_action", 
                action: "Kick", 
                target: "", 
                attribute: "", 
                args: [:]
            )
            .tagged(slot: 25, tag: "Keep Velocity", option: "False")
            .tagged(slot: 26, tag: "Keep Current Rotation", option: "False")
        )
    }

    func teleport(_ loc: Location) {
        GENERATED_CODE.append(SelectionBlock(
            block: "player_action", 
            action: "Teleport", 
            target: "", 
            attribute: "", 
            args: [
                0: loc.varItem
            ]
        ))
    }

    func sendMessage(_ message: AnyValue) {
        GENERATED_CODE.append(
            SelectionBlock.playerAction(
                action: "SendMessage", 
                args: [
                    0: message.varItem
                ]
            )
            .tagged(slot: 24, tag: "Inherit Styles", option: "True")
            .tagged(slot: 25, tag: "Text Value Merging", option: "Add spaces")
            .tagged(slot: 26, tag: "Alignment Mode", option: "Regular")
        )
        
    }
}

public protocol SelectionKind {
    
}
public struct Player: SelectionKind {}
public struct Entity: SelectionKind {}