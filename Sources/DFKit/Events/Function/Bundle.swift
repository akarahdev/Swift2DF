import DFCore

extension Function {
    struct ParameterBundle {
        let name: Swift.String
        let param: ParameterElementVarItem
        let variable: VariableVarItem
        let val: Expression

        static func make(_ value: Expression) -> ParameterBundle {
            let name = "s2df.param.\(NameGen.generateName())"
            return ParameterBundle(
                name: name,
                param: ParameterElementVarItem(name: name, type: "any"),
                variable: VariableVarItem(name: name, scope: "line"),
                val: value
            )
        }
    }
}
