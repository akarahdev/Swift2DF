import DFCore

public struct MobType: Expression {
    public init(varItem: any DFCore.VarItem) {
        self.varItem = varItem
    }

    public var varItem: any DFCore.VarItem

    public var parameterElementType: Swift.String = "item"

    public static let ZOMBIE = MobType(varItem: NbtItemVarItem(id: "zombie_spawn_egg", count: 1))
}

public extension Game {
    static func spawnMob(
        _ mobType: MobType,
        _ pos: Location
    ) -> Selection<Entity> {
        appendCodeBlock(
            SelectionBlock.gameAction(
                action: "SpawnMob",
                args: [
                    0 : mobType.varItem,
                    1 : pos.varItem
                ]
            )
        )
        return Selection.lastSpawnedEntity()
    }
}
