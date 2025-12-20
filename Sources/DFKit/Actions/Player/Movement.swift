import DFCore


public extension Selection<Player> {
    /// Teleports the player to the specified plot location.
    func teleport(_ loc: Location) {
        self.appendWrapped(
            SelectionBlock.playerAction(
                action: "Teleport",
                args: [
                    0: loc.varItem
                ]
            )
        )
    }
}
