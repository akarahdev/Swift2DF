public struct NumberExpr : Location {
    let val: String

    public func compile(cb: inout [any CodeBlock]) {
        
    }

    public func getVarItem() -> any VarItem {
        return NumberVarItem(name: self.val)
    }
}

public struct VariableExpr : Expression {
    public func compile(cb: inout [any CodeBlock]) {
        
    }

    public func getVarItem() -> any VarItem {
        return VariableVarItem(name: self.name, scope: self.scope)
    }

    let name: String
    let scope: String


    public static func makeWithRandomName(scope: String) -> VariableExpr {
        let varName: String = "var$" + [
            String(Int.random(in: Int.min...Int.max)),
            String(Int.random(in: Int.min...Int.max)),
            String(Int.random(in: Int.min...Int.max)),
            String(Int.random(in: Int.min...Int.max)),
            String(Int.random(in: Int.min...Int.max))
        ].joined(separator: "$")
        return VariableExpr(name: varName, scope: scope)
    }
}



public struct BlockTagExpr : Expression {
    public func compile(cb: inout [any CodeBlock]) {
        
    }

    public func getVarItem() -> any VarItem {
        return BlockTagVarItem(option: self.option, tag: self.tag, action: self.action, block: self.block)
    }

    let option: String
    let tag: String
    let action: String
    let block: String
}