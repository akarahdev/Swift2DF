public struct Text: AnyValue {
    public var varItem: any VarItem

}

func text(_ value: AnyValue) -> Text {
    let variable = VariableVarItem.generateRandomly(scope: "line")
    GENERATED_CODE.append(
        SelectionBlock.setVar(
            action: "StyledText", 
            args: [
                0: variable,
                1: value.varItem
            ]
        )
        .tagged(slot: 25, tag: "Inherit Styles", option: "True")
        .tagged(slot: 26, tag: "Text Value Merging", option: "No spaces")
    )
    return Text(varItem: variable)
}