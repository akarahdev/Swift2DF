protocol BlockExpression {
    var args: [Int : Expression] { get set }
    var action: Swift.String { get }

    func blockId() -> Swift.String
}

extension BlockExpression {
    consuming func tagged(slot: Int, tag: Swift.String, option: Swift.String) -> Self {
        self.args[slot] = BlockTagExpr(
            option: option, tag: tag, action: self.action, block: self.blockId()
        )
        return self
    }
}