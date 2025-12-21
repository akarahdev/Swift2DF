import DFCore

extension PlayerEvent {
    /// Executes code when a player takes damage.
    public static func playerTakeDamage(
        function: Swift.String = #function,
        fileName: Swift.String = #file,
        line: Int = #line,
        _ callable: (Selection<Player>) -> Void
    ) {
        appendCodeBlock(
            SelectionBlock.playerEvent(
                action: "PlayerTakeDmg"
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
        callable(Selection.victimPlayer())
    }

    /// Executes code when a player damages another player.
    public static func playerDamagePlayer(
        function: Swift.String = #function,
        fileName: Swift.String = #file,
        line: Int = #line,
        _ callable: (Selection<Player>, Selection<Player>) -> Void
    ) {
        appendCodeBlock(
            SelectionBlock.playerEvent(
                action: "PlayerDmgPlayer"
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
        callable(Selection.damagerPlayer(), Selection.victimPlayer())
    }

    /// Executes code when a player damages an entity.
    public static func playerDamageEntity(
        function: Swift.String = #function,
        fileName: Swift.String = #file,
        line: Int = #line,
        _ callable: (Selection<Player>) -> Void
    ) {
        appendCodeBlock(
            SelectionBlock.playerEvent(
                action: "DamageEntity"
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

    /// Executes code when an entity damages a player.
    public static func entityDamagePlayer(
        function: Swift.String = #function,
        fileName: Swift.String = #file,
        line: Int = #line,
        _ callable: (Selection<Player>) -> Void
    ) {
        appendCodeBlock(
            SelectionBlock.playerEvent(
                action: "EntityDamagePlayer"
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

    /// Executes code when a player respawns.
    public static func respawn(
        function: Swift.String = #function,
        fileName: Swift.String = #file,
        line: Int = #line,
        _ callable: (Selection<Player>) -> Void
    ) {
        appendCodeBlock(
            SelectionBlock.playerEvent(
                action: "Respawn"
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
