public struct NumberVarItem : VarItem {
    let name: Swift.String

    public func toJson() -> Json {
        return .object([
            "id": .string("num"),
            "data": .object([
                "name": .string(self.name)
            ])
        ])
    }
}