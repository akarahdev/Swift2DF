public struct StringVarItem : VarItem {
    let name: String

    public init(name: String) {
        self.name = name
    }

    public func toJson() -> Json {
        return .object([
            "id": .string("txt"),
            "data": .object([
                "name": .string(self.name)
            ])
        ])
    }
}