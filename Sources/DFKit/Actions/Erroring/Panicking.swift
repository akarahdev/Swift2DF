import DFCore

public func panic(_ message: String) {
    Function.make(message) { message in
        appendCodeBlock(
            SelectionBlock.control(
                action: "PrintDebug",
                args: [
                    0: message.varItem
                ]
            )
            .tagged(slot: 22, tag: "Permission", option: "Developer")
            .tagged(slot: 23, tag: "Text Value Merging", option: "Add Spaces")
            .tagged(slot: 24, tag: "Highlighting", option: "None")
            .tagged(slot: 25, tag: "Sound", option: "Default")
            .tagged(slot: 26, tag: "Message Style", option: "Error")
        )
        appendCodeBlock(
            SelectionBlock.control(
                action: "PrintDebug",
                args: [
                    0: VariableVarItem(name: "s2df.backtrace", scope: "local")
                ]
            )
            .tagged(slot: 22, tag: "Permission", option: "Developer")
            .tagged(slot: 23, tag: "Text Value Merging", option: "Add Spaces")
            .tagged(slot: 24, tag: "Highlighting", option: "None")
            .tagged(slot: 25, tag: "Sound", option: "Default")
            .tagged(slot: 26, tag: "Message Style", option: "Custom")
        )
        appendCodeBlock(
            SelectionBlock.control(
                action: "End",
                args: [:]
            )
        )
    }
}
