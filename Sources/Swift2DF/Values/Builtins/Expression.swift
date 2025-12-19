import Swift2DFCodegen

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

public protocol RecordExpression: Expression {
    var dict: Dictionary<String, AnyValue> { get set }
    init(dict: Dictionary<String, AnyValue>)
}

public extension RecordExpression {
    var varItem: VarItem {
        dict.varItem
    }

    var parameterElementType: Swift.String {
        dict.parameterElementType
    }

    init(varItem: VarItem) {
        self.init(dict: Dictionary(varItem: varItem))
    }
}
