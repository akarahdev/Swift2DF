public struct Location: AnyValue {
    public var varItem: any VarItem
}

extension Location {
    func shiftBy(
        x: Number = 0, 
        y: Number = 0, 
        z: Number = 0
    ) -> Self {
        let variable = VariableVarItem.generateRandomly(scope: "line")
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

func loc(
    x: Number = 0,
    y: Number = 0,
    z: Number = 0,
    pitch: Number = 0,
    yaw: Number = 0
) -> Location {
    let variable = VariableVarItem.generateRandomly(scope: "line")
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
    return Location(varItem: variable)
}