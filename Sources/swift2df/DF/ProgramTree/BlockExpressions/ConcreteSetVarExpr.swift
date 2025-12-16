public struct ConcreteSetVarExpr : Expression, BlockExpression, None, Location, Number, Text {
    func blockId() -> Swift.String {
        return "set_var"
    }

    public func compile(cb: inout [any CodeBlock]) {
        cb.append(SelectionBlock(
            block: "set_var", 
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
        return self.args[0]!.getVarItem()
    }

    let action: Swift.String
    var args: [Int : Expression]

    init(action: Swift.String, args: [Int : Expression]) {
        self.action = action
        self.args = args
    }
}