public protocol String: AnyValue {
    
}

extension Swift.String: String {
    public func compile(cb: inout [any CodeBlock]) {
        
    }

    public func getVarItem() -> any VarItem {
        return StringVarItem(name: Swift.String(self))
    }
}