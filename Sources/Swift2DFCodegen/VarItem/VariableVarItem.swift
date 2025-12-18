import Foundation

public struct VariableVarItem : VarItem {
    let name: String
    let scope: String

    public init(name: String, scope: String) {
        self.name = name
        self.scope = scope
    }

    public func toJson() -> Json {
        return .object([
            "id": .string("var"),
            "data": .object([
                "name": .string(self.name),
                "scope": .string(self.scope)
            ])
        ])
    }

    public static func generateRandomly() -> VariableVarItem {
        let uuid = UUID().description
        let finalSubstr = uuid[uuid.startIndex...uuid.index(uuid.startIndex, offsetBy: 6)]
        let varName: String = "s2df.var.\(finalSubstr).%var(s2df/depth)"
        return VariableVarItem(name: varName, scope: "local")
    }
}
