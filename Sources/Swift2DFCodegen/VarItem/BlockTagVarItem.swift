public struct BlockTagVarItem : VarItem {
    let option: String
    let tag: String
    let action: String
    let block: String

    public func toJson() -> Json {
        return .object([
            "id": .string("bl_tag"),
            "data": .object([
                "option": .string(self.option),
                "tag": .string(self.tag),
                "action": .string(self.action),
                "block": .string(self.block)
            ])
        ])
    }
}