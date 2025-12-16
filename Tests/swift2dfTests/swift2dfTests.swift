import Testing
@testable import swift2df

@PlayerEvent.Join
func onJoin(player: Selection<Player>) -> PlayerEvent {
    player.teleport(to: loc(x: 10, y: 50, z: 10).shiftBy(y: 20))
    player.sendMessage(message: loc(x: 20).x())
}

@PlayerEvent.Quit
func onQuit(player: Selection<Player>) -> PlayerEvent {
    player.kick()
}

@Test func name() {
    compile(onJoin, onQuit)
}