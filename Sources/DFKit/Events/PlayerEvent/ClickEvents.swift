import DFCore

extension PlayerEvent {
    /// Executes code when a player left clicks.
    public static func leftClick(
        function: Swift.String = #function,
        fileName: Swift.String = #file,
        line: Int = #line,
        _ callable: (Selection<Player>) -> Void
    ) {
        appendCodeBlock(
            SelectionBlock.playerEvent(
                action: "LeftClick"
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

    /// Executes code when a player right clicks.
    public static func rightClick(
        function: Swift.String = #function,
        fileName: Swift.String = #file,
        line: Int = #line,
        _ callable: (Selection<Player>) -> Void
    ) {
        appendCodeBlock(
            SelectionBlock.playerEvent(
                action: "RightClick"
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
}
