import Swift2DFCodegen

public struct Location: AnyValue {
    public var varItem: any VarItem

    public init(varItem: any VarItem) {
        self.varItem = varItem
    }

    public init(x: Number = 0, y: Number = 0, z: Number = 0, pitch: Number = 0, yaw: Number = 0) {
        let variable = VariableVarItem.generateRandomly()
        GENERATED_CODE.append(
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

extension Location {
    func shiftBy(
        x: Number = 0,
        y: Number = 0,
        z: Number = 0
    ) -> Self {
        let variable = VariableVarItem.generateRandomly()
        GENERATED_CODE.append(
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
}
