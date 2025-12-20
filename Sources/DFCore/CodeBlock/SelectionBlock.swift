public struct SelectionBlock: CodeBlock {
    let block: String
    var action: String = ""
    var data: String = ""
    var target: String = ""
    var attribute: String = ""
    var args: [Int: VarItem] = [:]

    public func toJson() -> Json {
        return .object([
            "id": .string("block"),
            "block": .string(self.block),
            "action": .string(self.action),
            "data": .string(self.data),
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

    public static func playerEvent(action: String) -> Self {
        return SelectionBlock(block: "event", action: action, args: [:])
    }

    public static func function(data: String, args: [Int : any VarItem]) -> Self {
        return SelectionBlock(block: "func", data: data, args: args)
    }

    public static func callFunction(data: String, args: [Int : any VarItem]) -> Self {
        return SelectionBlock(block: "call_func", data: data, args: args)
    }

    public static func playerAction(action: String, args: [Int : any VarItem]) -> Self {
        return SelectionBlock(block: "player_action", action: action, target: "Selection", args: args)
    }

    public static func gameAction(action: String, args: [Int : any VarItem]) -> Self {
        return SelectionBlock(block: "game_action", action: action, args: args)
    }

    public static func selectObject(action: String, args: [Int : any VarItem]) -> Self {
        return SelectionBlock(block: "select_obj", action: action, args: args)
    }

    public static func setVar(action: String, args: [Int : any VarItem]) -> Self {
        return SelectionBlock(block: "set_var", action: action, args: args)
    }

    public static func ifVar(action: String, args: [Int : any VarItem]) -> Self {
        return SelectionBlock(block: "if_var", action: action, args: args)
    }

    public static func control(action: String, args: [Int : any VarItem]) -> Self {
        return SelectionBlock(block: "control", action: action, args: args)
    }

    public static func repeatBlock(action: String, args: [Int : any VarItem]) -> Self {
        return SelectionBlock(block: "repeat", action: action, args: args)
    }

    public consuming func tagged(slot: Int, tag: String, option: String) -> Self {
        self.args[slot] = BlockTagVarItem(
            option: option,
            tag: tag,
            action: self.action,
            block: self.block
        )
        return self
    }


}
