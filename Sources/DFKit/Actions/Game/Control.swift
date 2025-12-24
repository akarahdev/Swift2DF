import DFCore

public extension Game {
    static func wait(ticks: Number) {
        appendCodeBlock(
            SelectionBlock.control(
                action: "Wait",
                args: [
                    0 : ticks.varItem
                ]
            )
            .tagged(slot: 26, tag: "Time Unit", option: "Ticks")
        )
    }
}
