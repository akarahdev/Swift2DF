public protocol Location: Expression {
    
}

extension Location {
    func shiftBy(
        x: Number = 0, 
        y: Number = 0, 
        z: Number = 0
    ) -> Location {
        return ConcreteSetVarExpr(
            action: "ShiftAllAxes", 
            args: [
                0: self,
                1: x,
                2: y,
                3: z
            ]
        )
    }

    func x() -> Number {
        return ConcreteSetVarExpr(
            action: "GetCoord", 
            args: [
                0: VariableExpr.makeWithRandomName(scope: "line"),
                1 : self,
                25: BlockTagExpr(
                    option: "Plot Coordinate", 
                    tag: "Coordinate Type", 
                    action: "GetCoord", 
                    block: "set_var"
                ),
                26: BlockTagExpr(
                    option: "X", 
                    tag: "Coordinate", 
                    action: "GetCoord", 
                    block: "set_var"
                )
            ]
        )
    }

    func y() -> Number {
        return ConcreteSetVarExpr(
            action: "GetCoord", 
            args: [
                0: VariableExpr.makeWithRandomName(scope: "line"),
                1 : self,
                25: BlockTagExpr(
                    option: "Plot Coordinate", 
                    tag: "Coordinate Type", 
                    action: "GetCoord", 
                    block: "set_var"
                ),
                26: BlockTagExpr(
                    option: "Y", 
                    tag: "Coordinate", 
                    action: "GetCoord", 
                    block: "set_var"
                )
            ]
        )
    }

    func z() -> Number {
        return ConcreteSetVarExpr(
            action: "GetCoord", 
            args: [
                0: VariableExpr.makeWithRandomName(scope: "line"),
                1 : self,
                25: BlockTagExpr(
                    option: "Plot Coordinate", 
                    tag: "Coordinate Type", 
                    action: "GetCoord", 
                    block: "set_var"
                ),
                26: BlockTagExpr(
                    option: "Z", 
                    tag: "Coordinate", 
                    action: "GetCoord", 
                    block: "set_var"
                )
            ]
        )
    }
}

func loc(
    x: Number = 0,
    y: Number = 0,
    z: Number = 0,
    pitch: Number = 0,
    yaw: Number = 0
) -> Location {
    return ConcreteSetVarExpr(action: "SetAllCoords", args: [
        0: VariableExpr.makeWithRandomName(scope: "line"),
        1: x,
        2: y,
        3: z,
        4: pitch,
        5: yaw,

        26: BlockTagExpr(option: "Plot coordinate", tag: "Coordinate Type", action: "SetAllCoords", block: "set_var")
    ])
}