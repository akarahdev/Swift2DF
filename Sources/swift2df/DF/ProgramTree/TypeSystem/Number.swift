public protocol Number: AnyValue {
    
}

extension Float64: Number {
    public func compile(cb: inout [any CodeBlock]) {
        
    }

    public func getVarItem() -> any VarItem {
        return NumberVarItem(name: String(self))
    }
}