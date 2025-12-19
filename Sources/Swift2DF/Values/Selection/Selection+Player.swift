import Swift2DFCodegen

public struct Player: SelectionKind {}

public extension Selection<Player> {
    static func defaultPlayer() -> Selection<Player> {
        let variable = VariableVarItem.generateRandomly()
        appendCodeBlock(
            SelectionBlock.setVar(
                action: "CreateList",
                args: [
                    0: variable,
                    1: GameTagVarItem(tagType: "UUID", target: "Default")
                ])
        )
        return Selection<Player>(varItem: variable)
    }

    func wrapInSelection(f: () -> Void) {
        appendCodeBlock(
            SelectionBlock.selectObject(
                action: "PlayerName",
                args: [
                    0: self.varItem
                ]
            )
        )
        f()
        appendCodeBlock(
            SelectionBlock.selectObject(
                action: "Reset",
                args: [:]
            )
        )
    }
}
