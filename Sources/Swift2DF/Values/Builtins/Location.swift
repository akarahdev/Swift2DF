import Swift2DFCodegen

public struct Location: Expression {
    public let parameterElementType: Swift.String = "loc"

    public var varItem: any VarItem

    public init(varItem: any VarItem) {
        self.varItem = varItem
    }

    public init(x: Number = 0, y: Number = 0, z: Number = 0, pitch: Number = 0, yaw: Number = 0) {
        let variable = VariableVarItem.generateRandomly()
        appendCodeBlock(
            SelectionBlock.setVar(
                action: "SetAllCoords",
                args: [
                    0: variable,
                    1: x.varItem,
                    2: y.varItem,
                    3: z.varItem,
                    4: pitch.varItem,
                    5: yaw.varItem
                ]
            )
            .tagged(slot: 26, tag: "Coordinate Type", option: "Plot coordinate")
        )
        self.varItem = variable
    }
}

public extension Location {
    @discardableResult
    func shift(
        x: Number = 0,
        y: Number = 0,
        z: Number = 0
    ) -> Self {
        let variable = VariableVarItem.generateRandomly()
        appendCodeBlock(
            SelectionBlock.setVar(
                action: "ShiftAllAxes",
                args: [
                    0: self.varItem,
                    1: x.varItem,
                    2: y.varItem,
                    3: z.varItem
                ]
            )
        )
        return Location(varItem: variable)
    }

    @discardableResult
    func shift(_ vec: Vector) -> Self {
        let variable = VariableVarItem.generateRandomly()
        appendCodeBlock(
            SelectionBlock.setVar(
                action: "ShiftOnVector",
                args: [
                    0: self.varItem,
                    1: vec.varItem
                ]
            )
            .tagged(slot: 26, tag: "Add Location Rotation", option: "False")
        )
        return Location(varItem: variable)
    }
}
