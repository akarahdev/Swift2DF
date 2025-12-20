import DFCore

public func formatDebugInfo(_ function: Swift.String, _ file: Swift.String, _ line: Int) -> Swift.String {
    return "at \(function) (\(file):\(line))"
}

public func panic(function: Swift.String = #function, line: Int = #line, fileName: Swift.String = #file, _ message: String) {
    Function.make(message) { message in
        appendCodeBlock(
            SelectionBlock.setVar(
                action: "PopListValue",
                args: [
                    0: VariableVarItem(name: "s2df.null", scope: "line"),
                    1: VariableVarItem(name: "s2df.backtrace", scope: "local")
                ]
            )
        )
        appendCodeBlock(
            SelectionBlock.setVar(
                action: "AppendValue",
                args: [
                    0: VariableVarItem(name: "s2df.backtrace", scope: "local"),
                    1: StringVarItem(name: formatDebugInfo(function, fileName, line))
                ]
            )
        )
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
            SelectionBlock.repeatBlock(
                action: "ForEach",
                args: [
                    0 : VariableVarItem(name: "s2df.backtrace_printer", scope: "line"),
                    1 : VariableVarItem(name: "s2df.backtrace", scope: "local")
                ]
            )
            .tagged(slot: 26, tag: "Allow List Changes", option: "True")
        )
        appendCodeBlock(
            BracketBlock.repeatOpen()
        )
        appendCodeBlock(
            SelectionBlock.control(
                action: "PrintDebug",
                args: [
                    0: VariableVarItem(name: "s2df.backtrace_printer", scope: "line")
                ]
            )
            .tagged(slot: 22, tag: "Permission", option: "Developer")
            .tagged(slot: 23, tag: "Text Value Merging", option: "Add Spaces")
            .tagged(slot: 24, tag: "Highlighting", option: "None")
            .tagged(slot: 25, tag: "Sound", option: "Default")
            .tagged(slot: 26, tag: "Message Style", option: "Debug")
        )
        appendCodeBlock(
            BracketBlock.repeatClose()
        )
        appendCodeBlock(
            SelectionBlock.control(
                action: "End",
                args: [:]
            )
        )
    }
}
