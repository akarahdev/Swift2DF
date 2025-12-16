public struct ConcreteSetVarExpr : Expression, None, Location, Number {

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

    let action: String
    var args: [Int : Expression]

    init(action: String, args: [Int : Expression]) {
        self.action = action
        self.args = args
    }
}