import Foundation

public struct ParameterElementVarItem : VarItem {
    let name: String
    let type: String

    public init(name: String, type: String) {
        self.name = name
        self.type = type
    }

    public func toJson() -> Json {
        return .object([
            "id": .string("pn_el"),
            "data": .object([
                "name": .string(self.name),
                "type": .string(self.type),
                "plural": .bool(false),
                "optional": .bool(false)
            ])
        ])
    }
}
