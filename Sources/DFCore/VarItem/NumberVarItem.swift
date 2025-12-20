public struct NumberVarItem : VarItem {
    public let name: String

    public init(name: String) {
        self.name = name
    }

    public func toJson() -> Json {
        return .object([
            "id": .string("num"),
            "data": .object([
                "name": .string(self.name)
            ])
        ])
    }
}