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

public func compile<T: CompilableArgument>(_ compilables: ((T) -> Action)...) {
    var actions: [Action] = []
    for compilable in compilables {
        actions.append(compilable(T.generateDefaultValue()))
    }
    for action in actions {
        var cb: [CodeBlock] = []
        action.compile(blocks: &cb)
        let cl = CodeLine(blocks: cb)
        print(cl.toJson().dfExported)
    }
}