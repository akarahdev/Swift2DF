public struct NumberVarItem : VarItem {
    let name: String

    public func toJson() -> Json {
        return .object([
            "id": .string("num"),
            "data": .object([
                "name": .string(self.name)
            ])
        ])
    }
}