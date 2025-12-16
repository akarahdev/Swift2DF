struct PlayerAction: Action {
    func compile(blocks: inout [any CodeBlock]) {
        blocks.append(SelectionBlock(
            block: "player_action", 
            action: self.action, 
            target: "", 
            attribute: "",
            args: self.args
        ))
    }

    let action: String
    let args: [Int : VarItem]
}