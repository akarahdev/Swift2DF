public struct StringVarItem : VarItem {
    let name: Swift.String

    public init(name: Swift.String) {
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