import DFCore


public extension Selection<Player> {
    func sendMessage(_ message: Text) {
        self.wrapInSelection {
            appendCodeBlock(
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
    }
}
