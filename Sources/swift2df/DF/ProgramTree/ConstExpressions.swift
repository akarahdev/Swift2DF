public struct NumberExpr : Location {
    let val: Swift.String

    public func compile(cb: inout [any CodeBlock]) {
        
    }

    public func getVarItem() -> any VarItem {
        return NumberVarItem(name: self.val)
    }
}

public struct StringExpr : Expression {
    let val: Swift.String

    public func compile(cb: inout [any CodeBlock]) {
        
    }

    public func getVarItem() -> any VarItem {
        return StringVarItem(name: self.val)
    }
}

public struct VariableExpr : Expression {
    public func compile(cb: inout [any CodeBlock]) {
        
    }

    public func getVarItem() -> any VarItem {
        return VariableVarItem(name: self.name, scope: self.scope)
    }

    let name: Swift.String
    let scope: Swift.String


    public static func makeWithRandomName(scope: Swift.String) -> VariableExpr {
        let varName: Swift.String = "var$" + [
            Swift.String(Int.random(in: Int.min...Int.max)),
            Swift.String(Int.random(in: Int.min...Int.max)),
            Swift.String(Int.random(in: Int.min...Int.max)),
            Swift.String(Int.random(in: Int.min...Int.max)),
            Swift.String(Int.random(in: Int.min...Int.max))
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

    let option: Swift.String
    let tag: Swift.String
    let action: Swift.String
    let block: Swift.String
}