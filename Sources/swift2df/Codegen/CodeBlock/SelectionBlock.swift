struct SelectionBlock: CodeBlock {
    let block: Swift.String
    let action: Swift.String
    let target: Swift.String
    let attribute: Swift.String
    var args: [Int: VarItem]

    
    func toJson() -> Json {
        return .object([
            "id": .string("block"),
            "block": .string(self.block),
            "action": .string(self.action),
            "target": .string(self.target),
            "attribute": .string(self.attribute),
            "args": .object([
                "items": .array(
                    self.args.map() { key, value in
                        return Json.object([
                            "item": value.toJson(),
                            "slot": .number(Float64(key))
                        ]) 
                    }
                )
            ])
        ])        
    }

    static func playerAction(action: Swift.String, args: [Int : any VarItem]) -> Self {
        return SelectionBlock(block: "player_action", action: action, target: "", attribute: "", args: args)
    }

    static func gameAction(action: Swift.String, args: [Int : any VarItem]) -> Self {
        return SelectionBlock(block: "game_action", action: action, target: "", attribute: "", args: args)
    }

    static func setVar(action: Swift.String, args: [Int : any VarItem]) -> Self {
        return SelectionBlock(block: "set_var", action: action, target: "", attribute: "", args: args)
    }

    consuming func tagged(slot: Int, tag: Swift.String, option: Swift.String) -> Self {
        self.args[slot] = BlockTagVarItem(
            option: option, 
            tag: tag, 
            action: self.action, 
            block: self.block
        )
        return self
    }


}