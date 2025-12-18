import Swift2DFCodegen

public func compile(_ compilables: (() -> Void)...) {
    Swift2DFCodegen.compile(Array(compilables))
}