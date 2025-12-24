import DFCore

public struct Entity: SelectionKind {}

public extension Selection<Entity> {
    static func lastSpawnedEntity() -> Selection<Entity> {
        let variable = VariableVarItem.generateRandomly()
        appendCodeBlock(
            SelectionBlock.setVar(
                action: "CreateList",
                args: [
                    0: variable,
                    1: GameTagVarItem(tagType: "UUID", target: "Last-Spawned Entity")
                ])
        )
        return Selection<Entity>(varItem: variable)
    }
}
