public struct VariableVarItem : VarItem {
    let name: Swift.String
    let scope: Swift.String

    public init(name: Swift.String, scope: Swift.String) {
        self.name = name
        self.scope = scope
    }

    public func toJson() -> Json {
        return .object([
            "id": .string("var"),
            "data": .object([
                "name": .string(self.name),
                "scope": .string(self.scope)
            ])
        ])
    }

    public static func generateRandomly(scope: Swift.String) -> VariableVarItem {
        let varName: Swift.String = "var$" + [
            Swift.String(Int.random(in: Int.min...Int.max)),
            Swift.String(Int.random(in: Int.min...Int.max)),
            Swift.String(Int.random(in: Int.min...Int.max)),
            Swift.String(Int.random(in: Int.min...Int.max)),
            Swift.String(Int.random(in: Int.min...Int.max))
        ].joined(separator: "$")
        return VariableVarItem(name: varName, scope: scope)
    }
}