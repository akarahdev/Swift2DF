public struct BlockTagVarItem : VarItem {
    let option: Swift.String
    let tag: Swift.String
    let action: Swift.String
    let block: Swift.String

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