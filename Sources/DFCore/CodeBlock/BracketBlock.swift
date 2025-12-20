public struct BracketBlock: CodeBlock {
    let direct: String
    let type: String

    public func toJson() -> Json {
        return .object([
            "id": .string("bracket"),
            "direct": .string(self.direct),
            "type": .string(self.type)
        ])
    }

    public static func repeatOpen() -> Self {
        return BracketBlock(direct: "open", type: "repeat")
    }

    public static func repeatClose() -> Self {
        return BracketBlock(direct: "close", type: "repeat")
    }

    public static func normOpen() -> Self {
        return BracketBlock(direct: "open", type: "norm")
    }

    public static func normClose() -> Self {
        return BracketBlock(direct: "close", type: "norm")
    }
}
