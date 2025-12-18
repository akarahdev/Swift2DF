import Swift2DFCodegen

public protocol Expression: Sendable {
    var varItem: VarItem { get }
}