public struct Expression<T>: Sendable {
    let compile: @Sendable (inout [CodeBlock]) -> Void
    let getVarItem: @Sendable () -> VarItem
}