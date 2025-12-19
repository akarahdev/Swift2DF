import Swift2DFCodegen


public extension Selection<Player> {
    func teleport(_ loc: Location) {
        self.wrapInSelection {
            appendCodeBlock(
                SelectionBlock.playerAction(
                    action: "Teleport",
                    args: [
                        0: loc.varItem
                    ]
                )
            )
        }
    }
}
