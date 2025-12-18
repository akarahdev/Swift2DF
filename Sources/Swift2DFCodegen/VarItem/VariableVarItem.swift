import Foundation

public struct VariableVarItem : VarItem {
    public let name: String
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

    public static func generateRandomly(scope: String = "line") -> VariableVarItem {
        let finalSubstr = NameGen.generateName()
        let varName: String = "s2df.var.\(finalSubstr)"
        return VariableVarItem(name: varName, scope: scope)
    }

    public func copyWithScope(scope: String) -> VariableVarItem {
        return VariableVarItem(name: self.name, scope: scope)
    }
}
