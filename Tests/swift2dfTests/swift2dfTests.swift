import Testing
@testable import swift2df

@PlayerEvent.Join
func onJoin(player: Selection<Player>) -> PlayerEvent {
    let l = loc(x: 10, y: 50, z: 40).shiftBy(x: 40)
    player.teleport(l)
}

@PlayerEvent.Quit
func onQuit(player: Selection<Player>) -> PlayerEvent {
    player.kick()
}

@Test func name() {
    compile(onJoin, onQuit)
}