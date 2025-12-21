import DFCore

extension PlayerEvent {
    public static func join(
        function: Swift.String = #function,
        fileName: Swift.String = #file,
        line: Int = #line,
        _ callable: (Selection<Player>) -> Void
    ) {
        appendCodeBlock(
            SelectionBlock.playerEvent(
                action: "Join"
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
        callable(Selection.defaultPlayer())
    }

    public static func leave(
        function: Swift.String = #function,
        fileName: Swift.String = #file,
        line: Int = #line,
        _ callable: (Selection<Player>) -> Void
    ) {
        appendCodeBlock(
            SelectionBlock.playerEvent(
                action: "Leave"
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
        callable(Selection.defaultPlayer())
    }

    public static func command(
        function: Swift.String = #function,
        fileName: Swift.String = #file,
        line: Int = #line,
        _ callable: (Selection<Player>, String) -> Void
    ) {
        appendCodeBlock(
            SelectionBlock.playerEvent(
                action: "Command"
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
        callable(Selection.defaultPlayer(), String(varItem: GameTagVarItem(tagType: "Event Command", target: "Default")))
    }

    public static func chat(
        function: Swift.String = #function,
        fileName: Swift.String = #file,
        line: Int = #line,
        _ callable: (Selection<Player>, String) -> Void
    ) {
        appendCodeBlock(
            SelectionBlock.playerEvent(
                action: "Chat"
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
        callable(Selection.defaultPlayer(), String(varItem: GameTagVarItem(tagType: "Event Message", target: "Default")))
    }

    public static func resourcePackLoad(
        function: Swift.String = #function,
        fileName: Swift.String = #file,
        line: Int = #line,
        _ callable: (Selection<Player>) -> Void
    ) {
        appendCodeBlock(
            SelectionBlock.playerEvent(
                action: "PackLoad"
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
        callable(Selection.defaultPlayer())
    }

    public static func resourcePackDecline(
        function: Swift.String = #function,
        fileName: Swift.String = #file,
        line: Int = #line,
        _ callable: (Selection<Player>) -> Void
    ) {
        appendCodeBlock(
            SelectionBlock.playerEvent(
                action: "PackDecline"
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
        callable(Selection.defaultPlayer())
    }

    public static func viewVIPPerks(
        function: Swift.String = #function,
        fileName: Swift.String = #file,
        line: Int = #line,
        _ callable: (Selection<Player>) -> Void
    ) {
        appendCodeBlock(
            SelectionBlock.playerEvent(
                action: "ViewVipPerks"
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
        callable(Selection.defaultPlayer())
    }

    public static func purchaseProduct(
        function: Swift.String = #function,
        fileName: Swift.String = #file,
        line: Int = #line,
        _ callable: (Selection<Player>, String) -> Void
    ) {
        appendCodeBlock(
            SelectionBlock.playerEvent(
                action: "Purchase"
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
        callable(Selection.defaultPlayer(), String(varItem: GameTagVarItem(tagType: "Product ID", target: "Default")))
    }
}
