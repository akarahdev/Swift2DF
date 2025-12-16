struct SelectionBlock: CodeBlock {
    let block: Swift.String;
    let action: Swift.String;
    let target: Swift.String;
    let attribute: Swift.String;
    let args: [Int: VarItem];

    
    func toJson() -> Json {
        return .object([
            "id": .string("block"),
            "block": .string(self.block),
            "action": .string(self.action),
            "target": .string(self.target),
            "attribute": .string(self.attribute),
            "args": .object([
                "items": .array(
                    self.args.map() { key, value in
                        return Json.object([
                            "item": value.toJson(),
                            "slot": .number(Float64(key))
                        ]) 
                    }
                )
            ])
        ])        
    }


}