public protocol Text: AnyValue {
}

func text(_ value: AnyValue) -> Text {
    return ConcreteSetVarExpr(
        action: "StyledText", 
        args: [
            0: VariableExpr.makeWithRandomName(scope: "line"),
            1: value
        ]
    )
    .tagged(slot: 25, tag: "Inherit Styles", option: "True")
    .tagged(slot: 26, tag: "Text Value Merging", option: "No spaces")
}