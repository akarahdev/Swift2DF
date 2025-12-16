public struct VariableVarItem : VarItem {
    let name: Swift.String
    let scope: Swift.String

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