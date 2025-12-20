import DFCore

public func compile(_ compilables: (() -> Void)...) {
    DFCore.compile(Array(compilables))
}
