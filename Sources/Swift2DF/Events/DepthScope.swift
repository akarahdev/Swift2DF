import Swift2DFCodegen

func depthScope(f: () -> Void) {
    GENERATED_CODE.append(
        SelectionBlock.setVar(
            action: "+=", 
            args: [
                0: VariableVarItem(name: "s2df/depth", scope: "local")   
            ]
        )
    )
    f()
    GENERATED_CODE.append(
        SelectionBlock.setVar(
            action: "-=", 
            args: [
                0: VariableVarItem(name: "s2df/depth", scope: "local")   
            ]
        )
    )
}