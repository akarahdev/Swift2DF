public struct NumberVarItem : VarItem {
    public let name: Swift.String

    public init(name: Swift.String) {
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