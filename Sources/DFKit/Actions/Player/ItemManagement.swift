import DFCore

public extension Selection<Player> {
    /// Adds the item to the player's inventory.
    func giveItem(_ item: Item) {
        self.appendWrapped(
            SelectionBlock.playerAction(
                action: "GiveItems",
                args: [
                    0: item.varItem
                ]
            )
        )
    }

    /// Removes the specified items from the player's inventory.
    func removeItem(_ item: Item) {
        self.appendWrapped(
            SelectionBlock.playerAction(
                action: "RemoveItems",
                args: [
                    0: item.varItem
                ]
            )
        )
    }

    /// Clears the player's inventory.
    func clearInventory() {
        self.appendWrapped(
            SelectionBlock.playerAction(
                action: "ClearInv",
                args: [:]
            )
            .tagged(slot: 25, tag: "Clear Crafting and Cursor", option: "True")
            .tagged(slot: 25, tag: "Clear Mode", option: "Entire inventory")
        )
    }
}
