import DFCore

public struct Vector: Expression {
    public let parameterElementType: Swift.String = "vec"

    public var varItem: any VarItem

    public init(varItem: any VarItem) {
        self.varItem = varItem
    }

    public init(x: Number = 0, y: Number = 0, z: Number = 0) {
        let variable = VariableVarItem.generateRandomly()
        appendCodeBlock(
            SelectionBlock.setVar(
                action: "Vector",
                args: [
                    0: variable,
                    1: x.varItem,
                    2: y.varItem,
                    3: z.varItem
                ]
            )
        )
        self.varItem = variable
    }
}

public extension Vector {
    static func +(
        lhs: Vector,
        rhs: Vector
    ) -> Vector {
        let variable = VariableVarItem.generateRandomly()
        appendCodeBlock(
            SelectionBlock.setVar(
                action: "+",
                args: [
                    0: variable,
                    1: lhs.varItem,
                    2: rhs.varItem
                ]
            )
        )
        return Vector(varItem: variable)
    }
}

public extension Vector {
    var x: Number {
        get {
            let variable = VariableVarItem.generateRandomly()
            appendCodeBlock(
                SelectionBlock.setVar(
                    action: "GetVectorComp",
                    args: [
                        0: variable,
                        1: self.varItem
                    ]
                )
                .tagged(slot: 26, tag: "Component", option: "X")
            )
            return Number(varItem: variable)
        }
        set(newValue) {
            appendCodeBlock(
                SelectionBlock.setVar(
                    action: "SetVectorComp",
                    args: [
                        0: self.varItem,
                        1: newValue.varItem
                    ]
                )
                .tagged(slot: 26, tag: "Component", option: "X")
            )
        }
    }

    var y: Number {
        get {
            let variable = VariableVarItem.generateRandomly()
            appendCodeBlock(
                SelectionBlock.setVar(
                    action: "GetVectorComp",
                    args: [
                        0: variable,
                        1: self.varItem
                    ]
                )
                .tagged(slot: 26, tag: "Component", option: "Y")
            )
            return Number(varItem: variable)
        }
        set(newValue) {
            appendCodeBlock(
                SelectionBlock.setVar(
                    action: "SetVectorComp",
                    args: [
                        0: self.varItem,
                        1: newValue.varItem
                    ]
                )
                .tagged(slot: 26, tag: "Component", option: "Y")
            )
        }
    }

    var z: Number {
        get {
            let variable = VariableVarItem.generateRandomly()
            appendCodeBlock(
                SelectionBlock.setVar(
                    action: "GetVectorComp",
                    args: [
                        0: variable,
                        1: self.varItem
                    ]
                )
                .tagged(slot: 26, tag: "Component", option: "Z")
            )
            return Number(varItem: variable)
        }
        set(newValue) {
            appendCodeBlock(
                SelectionBlock.setVar(
                    action: "SetVectorComp",
                    args: [
                        0: self.varItem,
                        1: newValue.varItem
                    ]
                )
                .tagged(slot: 26, tag: "Component", option: "Z")
            )
        }
    }
}
