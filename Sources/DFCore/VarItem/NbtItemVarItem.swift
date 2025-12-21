public struct NbtItemVarItem : VarItem {
    var nbt: String {
        "{DF_NBT:4440,count:\(count),id:\"\(id)\"}"
    }
    public let count: Int
    public let id: String

    public init(id: String, count: Int) {
        self.count = count
        self.id = id
    }

    public func toJson() -> Json {
        return .object([
            "id": .string("item"),
            "data": .object([
                "item": .string(self.nbt)
            ])
        ])
    }
}
