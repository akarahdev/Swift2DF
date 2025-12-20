import DFCore

public struct Text: Expression {
    public let parameterElementType: Swift.String = "comp"

    public var varItem: any VarItem

    public init(varItem: any VarItem) {
        self.varItem = varItem
    }

    public init(_ contents: String) {
        let variable = VariableVarItem.generateRandomly()
        appendCodeBlock(
            SelectionBlock.setVar(
                action: "ParseMiniMessage",
                args: [
                    0: variable,
                    1: contents.varItem
                ]
            )
            .tagged(slot: 25, tag: "Parse Legacy Color Codes", option: "False")
            .tagged(slot: 26, tag: "Allowed Tags", option: "Full")
        )
        self.varItem = variable
    }

    public init<T: Expression>(_ contents: T) {
        let variable = VariableVarItem.generateRandomly()
        appendCodeBlock(
            SelectionBlock.setVar(
                action: "StyledText",
                args: [
                    0: variable,
                    1: contents.varItem
                ]
            )
            .tagged(slot: 25, tag: "Inherit Styles", option: "True")
            .tagged(slot: 26, tag: "Text Value Merging", option: "No Spaces")
        )
        self.varItem = variable
    }
}
