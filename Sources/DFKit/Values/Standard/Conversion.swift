import DFCore

postfix operator /

public extension Swift.Int {
    static postfix func /(self: Swift.Int) -> Number {
        return Number(varItem: NumberVarItem(name: Swift.String(self)))
    }
}

public extension Swift.String {
    static postfix func /(self: Swift.String) -> String {
        return String(varItem: StringVarItem(name: self))
    }
}
