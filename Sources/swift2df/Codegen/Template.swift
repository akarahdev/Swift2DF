public protocol CompilableArgument {
    static func generateDefaultValue() -> Self;
}

extension Selection<Player>: CompilableArgument {
    public static func generateDefaultValue() -> Selection<K> {
        return Selection()
    }
}

public struct Compile {

}

public func compile<T: CompilableArgument>(_ compilables: ((T) -> PlayerEvent)...) {
    var actions: [Expression<Void>] = []
    for compilable in compilables {
        let event = compilable(T.generateDefaultValue())
        actions.append(Expression(compile: { cb in 
            _ = event.compile(blocks: &cb)
        }, getVarItem: { () in NullVarItem() }))
    }
    for action in actions {
        var cb: [CodeBlock] = []
        _ = action.compile(&cb)
        let cl = CodeLine(blocks: cb)
        print(cl.toJson().dfExported)
    }
}