import DFCore

extension Selection<Player> {
    /// Kicks the player from the plot.
    func kick() {
        self.appendWrapped(
            SelectionBlock.playerAction(
                action: "Kick",
                args: [:]
            )
            .tagged(slot: 25, tag: "Keep Velocity", option: "False")
            .tagged(slot: 26, tag: "Keep Current Rotation", option: "False")
        )
    }

    /// Sends the player to another plot.
    func sendToPlot(handle: String) {
        self.appendWrapped(
            SelectionBlock.playerAction(
                action: "SendToPlot",
                args: [
                    0: handle.varItem
                ]
            )
            .tagged(slot: 25, tag: "Keep Velocity", option: "False")
            .tagged(slot: 26, tag: "Keep Current Rotation", option: "False")
        )
    }

    /// Undoes the interactions with blocks done by a player.
    func rollBackBlockChanges(seconds: Number = 1000000000) {
        self.appendWrapped(
            SelectionBlock.playerAction(
                action: "RollbackBlocks",
                args: [
                    0: seconds.varItem
                ]
            )
        )
    }

    /// Prompts the player to purchase a plot product.
    func promptPurchase(_ purchase: String) {
        self.appendWrapped(
            SelectionBlock.playerAction(
                action: "PromptPurchase",
                args: [
                    0: purchase.varItem
                ]
            )
        )
    }
}
