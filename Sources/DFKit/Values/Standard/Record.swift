import DFCore

/// Represents a structured version of a Dictionary with fixed keys.
public protocol Record: Expression {
    var dict: Dictionary<String, AnyValue> { get set }
    init(dict: Dictionary<String, AnyValue>)
}

public extension Record {
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
