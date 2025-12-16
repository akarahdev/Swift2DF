import Testing
@testable import swift2df

func onJoin() {
    PlayerEvent.join {
        let l = loc(x: 10, y: 50, z: 40)
        _ = l.shiftBy(x: 40)
        Selection.defaultPlayer().teleport(l)
    }
}

@Test func name() {
    compile(onJoin)
}