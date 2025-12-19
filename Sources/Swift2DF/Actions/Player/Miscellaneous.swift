import Swift2DFCodegen

extension Selection<Player> {
    func kick() {
        self.wrapInSelection {
            appendCodeBlock(
                SelectionBlock.playerAction(
                    action: "Kick",
                    args: [:]
                )
                .tagged(slot: 25, tag: "Keep Velocity", option: "False")
                .tagged(slot: 26, tag: "Keep Current Rotation", option: "False")
            )
        }
    }
}
