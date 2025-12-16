

public struct PlayerEventExpr : None {
    public func compile(cb: inout [any CodeBlock]) {
        cb.append(SelectionBlock(block: "event", action: self.action, target: "", attribute: "", args: [:]))
    }

    public func getVarItem() -> any VarItem {
        return NullVarItem()
    }

    let action: Swift.String
}