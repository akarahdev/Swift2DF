public struct GameTagVarItem : VarItem {
    let tagType: String
    let target: String

    public init(tagType: String, target: String) {
        self.tagType = tagType
        self.target = target
    }

    public func toJson() -> Json {
        return .object([
            "id": .string("g_val"),
            "data": .object([
                "type": .string(self.tagType),
                "target": .string(self.target)
            ])
        ])
    }
}
