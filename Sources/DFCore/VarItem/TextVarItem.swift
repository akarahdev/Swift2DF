public struct TextVarItem : VarItem {
    let name: String

    public init(name: String) {
        self.name = name
    }

    public func toJson() -> Json {
        return .object([
            "id": .string("comp"),
            "data": .object([
                "name": .string(self.name)
            ])
        ])
    }
}
