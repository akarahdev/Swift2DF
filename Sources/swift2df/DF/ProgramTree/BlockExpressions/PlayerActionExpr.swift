public struct PlayerActionExpr : None {
    public func compile(cb: inout [any CodeBlock]) {
        cb.append(SelectionBlock(
            block: "player_action", 
            action: self.action, 
            target: "", 
            attribute: "", 
            args: self.args.mapValues({ x in 
                x.compile(cb: &cb)
                return x.getVarItem() 
            })
        ))
    }

    public func getVarItem() -> any VarItem {
        return NullVarItem()
    }

    let action: String
    let args: [Int : Expression]
}