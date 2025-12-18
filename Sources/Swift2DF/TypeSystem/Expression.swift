import Swift2DFCodegen

public protocol Expression: Sendable {
    init(varItem: VarItem)

    var varItem: VarItem { get }
    var parameterElementType: Swift.String { get }
}
