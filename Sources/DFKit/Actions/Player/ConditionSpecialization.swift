import DFCore

extension Selection<Player> {
    func conditional(
        action: Swift.String,
        args: [Int : any VarItem]
    ) -> Bool {
        let variable = VariableVarItem.generateRandomly()
        appendCodeBlock(
            SelectionBlock.ifPlayer(
                action: action, args: args
            )
        )
        appendCodeBlock(BracketBlock.normOpen())
        appendCodeBlock(
            SelectionBlock.setVar(
                action: "=",
                args: [
                    0 : variable,
                    1 : StringVarItem(name: "true")
                ]
            )
        )
        appendCodeBlock(BracketBlock.normClose())
        appendCodeBlock(SelectionBlock.elseBlock())
        appendCodeBlock(BracketBlock.normOpen())
        appendCodeBlock(
            SelectionBlock.setVar(
                action: "=",
                args: [
                    0 : variable,
                    1 : StringVarItem(name: "false")
                ]
            )
        )
        appendCodeBlock(BracketBlock.normClose())
        return Bool(varItem: variable)
    }
}
