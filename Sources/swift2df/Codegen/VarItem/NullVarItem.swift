public struct NullVarItem : VarItem {
    public func toJson() -> Json {
        return .object([:])
    }
}