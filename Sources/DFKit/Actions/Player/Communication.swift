import DFCore

// TODO: PlaySound, OpenBook

public extension Selection<Player> {
    /// Sends a message to the player in the chat.
    func sendMessage(_ message: Text) {
        appendWrapped(
            SelectionBlock.playerAction(
                action: "SendMessage",
                args: [
                    0: message.varItem
                ]
            )
            .tagged(slot: 24, tag: "Inherit Styles", option: "True")
            .tagged(slot: 25, tag: "Text Value Merging", option: "Add spaces")
            .tagged(slot: 26, tag: "Alignment Mode", option: "Regular")
        )
    }

    /// Sends a title to the player on their screen.
    func sendTitle(title: Text, subtitle: Text = Text(""), fadeIn: Number = 10, duration: Number = 60, fadeOut: Number = 10) {
        self.appendWrapped(
            SelectionBlock.playerAction(
                action: "SendTitle",
                args: [
                    0: title.varItem,
                    1: subtitle.varItem,
                    2: fadeIn.varItem,
                    3: duration.varItem,
                    4: fadeOut.varItem
                ]
            )
        )
    }

    /// Sends an action bar above the player's hotbar.
    func sendActionBar(_ message: Text) {
        self.appendWrapped(
            SelectionBlock.playerAction(
                action: "ActionBar",
                args: [
                    0: message.varItem
                ]
            )
            .tagged(slot: 24, tag: "Inherit Styles", option: "True")
            .tagged(slot: 25, tag: "Text Value Merging", option: "Add spaces")
        )
    }

    /// Sends a boss bar to the player on the top of their screen.
    func sendBossBar(_ title: Text, currentHealth: Number = 100, maximumHealth: Number = 100, position: Number = 1) {
        self.appendWrapped(
            SelectionBlock.playerAction(
                action: "SetBossBar",
                args: [
                    0: title.varItem,
                    1: currentHealth.varItem,
                    2: maximumHealth.varItem,
                    3: position.varItem
                ]
            )
            .tagged(slot: 24, tag: "Sky Effect", option: "None")
            .tagged(slot: 25, tag: "Bar Style", option: "Solid")
            .tagged(slot: 26, tag: "Bar Color", option: "Purple")
        )
    }

    /// Removes a bossbar at the given position from the player.
    func removeBossBar(position: Number = 1) {
        self.appendWrapped(
                SelectionBlock.playerAction(
                    action: "RemoveBossBar",
                    args: [
                        3: position.varItem
                    ]
                )
        )
    }

    /// Removes all boss bars the player can see.
    func removeAllBossBars() {
        self.appendWrapped(
            SelectionBlock.playerAction(
                action: "RemoveBossBar",
                args: [:]
            )
        )
    }

    func sendTablistHeader(_ text: Text) {
        self.appendWrapped(
            SelectionBlock.playerAction(
                action: "SetTabListInfo",
                args: [
                    0 : text.varItem
                ]
            )
            .tagged(slot: 24, tag: "Inherit Styles", option: "True")
            .tagged(slot: 25, tag: "Text Value Merging", option: "No Spaces")
            .tagged(slot: 26, tag: "Player List Field", option: "Header")
        )
    }

    func sendTablistFooter(_ text: Text) {
        self.appendWrapped(
            SelectionBlock.playerAction(
                action: "SetTabListInfo",
                args: [
                    0 : text.varItem
                ]
            )
            .tagged(slot: 24, tag: "Inherit Styles", option: "True")
            .tagged(slot: 25, tag: "Text Value Merging", option: "No Spaces")
            .tagged(slot: 26, tag: "Player List Field", option: "Footer")
        )
    }
}
