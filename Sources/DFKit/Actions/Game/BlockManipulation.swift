import DFCore

public extension Game {
    static func setBlock(
        _ block: String,
        _ loc: Location
    ) {
        appendCodeBlock(
            SelectionBlock.gameAction(
                action: "SetBlock",
                args: [
                    0 : block.varItem,
                    1 : loc.varItem
                ]
            )
        )
    }

    static func setRegion(
        _ block: String,
        _ corner1: Location,
        _ corner2: Location
    ) {
        appendCodeBlock(
            SelectionBlock.gameAction(
                action: "SetBlock",
                args: [
                    0 : block.varItem,
                    1 : corner1.varItem,
                    2 : corner2.varItem
                ]
            )
        )
    }

    static func breakBlock(
        _ loc: Location
    ) {
        appendCodeBlock(
            SelectionBlock.gameAction(
                action: "BreakBlock",
                args: [
                    0 : loc.varItem,
                ]
            )
        )
    }

    static func setBlockData(
        _ loc: Location,
        _ tag: String
    ) {
        appendCodeBlock(
            SelectionBlock.gameAction(
                action: "SetBlockData",
                args: [
                    0 : loc.varItem,
                    1 : tag.varItem
                ]
            )
            .tagged(slot: 26, tag: "Overwrite Existing Data", option: "False")
        )
    }
}
