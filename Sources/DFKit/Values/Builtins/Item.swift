import DFCore

/// Represents items that can be given to players or entities.
public struct Item: Expression {
    public let parameterElementType: Swift.String = "item"

    public init(varItem: any VarItem) {
        self.varItem = varItem
    }

    public init(id: Swift.String, count: Swift.Int = 1) {
        self.varItem = NbtItemVarItem(id: id, count: 1)
    }

    public init(id: String, count: Number = 1) {
        if let cn = id.varItem as? StringVarItem {
            self.varItem = NbtItemVarItem(id: cn.name, count: 1)
        } else {
            let variable = VariableVarItem.generateRandomly()
            appendCodeBlock(
                SelectionBlock.setVar(
                    action: "SetItemType",
                    args: [
                        0 : variable,
                        1 : id.varItem
                    ]
                )
            )
            self.varItem = variable
        }
        if let cn = count.varItem as? NumberVarItem {
            if cn.name == "1" {
                if let item = self.varItem as? NbtItemVarItem {
                    self.varItem = NbtItemVarItem(id: item.id, count: Int(cn.name)!)
                }
                return
            }
        }
        appendCodeBlock(
            SelectionBlock.setVar(
                action: "SetItemAmount",
                args: [
                    0 : self.varItem,
                    1 : count.varItem
                ]
            )
        )
    }

    public var varItem: any VarItem
}
