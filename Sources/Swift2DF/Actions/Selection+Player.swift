import Swift2DFCodegen

public struct Player: SelectionKind {}

public extension Selection<Player> {
    static func defaultPlayer() -> Selection<Player> {
        let variable = VariableVarItem.generateRandomly()
        GENERATED_CODE.append(
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
        GENERATED_CODE.append(
            SelectionBlock.selectObject(
                action: "PlayerName", 
                args: [
                    0: self.varItem
                ]
            )
        )
        f()
        GENERATED_CODE.append(
            SelectionBlock.selectObject(
                action: "Reset", 
                args: [:]
            )
        )
    }

    func kick() {
        self.wrapInSelection {
            GENERATED_CODE.append(
                SelectionBlock.playerAction(
                    action: "Kick", 
                    args: [:]
                )
                .tagged(slot: 25, tag: "Keep Velocity", option: "False")
                .tagged(slot: 26, tag: "Keep Current Rotation", option: "False")
            )
        }
    }

    func teleport(_ loc: Location) {
        self.wrapInSelection {
            GENERATED_CODE.append(
                SelectionBlock.playerAction(
                    action: "Teleport", 
                    args: [
                        0: loc.varItem
                    ]
                )
            )
        }
    }

    func sendMessage(_ message: AnyValue) {
        self.wrapInSelection {
            GENERATED_CODE.append(
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