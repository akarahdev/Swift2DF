public struct VariableVarItem : VarItem {
    let name: String
    let scope: String

    public func toJson() -> Json {
        return .object([
            "id": .string("var"),
            "data": .object([
                "name": .string(self.name),
                "scope": .string(self.scope)
            ])
        ])
    }
}