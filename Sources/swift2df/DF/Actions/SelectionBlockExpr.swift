public struct SelectionBlockExpr : Expression {
    let block: String;
    let action: String;
    let target: String;
    let attribute: String;
    let args: [Int: Expression];
    
    public func compile(blocks: inout [any CodeBlock]) -> any VarItem {
        blocks.append(SelectionBlock(
            block: self.block,
            action: self.action,
            target: self.target,
            attribute: self.attribute,
            args: self.args.mapValues() { x in x.compile(blocks: &blocks) }
        ))
        return NullVarItem()
    }
}