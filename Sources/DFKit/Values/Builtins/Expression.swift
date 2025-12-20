import DFCore

public protocol Expression: Sendable {
    init(varItem: VarItem)

    var varItem: VarItem { get }
    var parameterElementType: Swift.String { get }
}

public extension Expression {
    func asType<T: Expression>(_ ty: T.Type) -> T {
        return T(varItem: self.varItem)
    }
}
