import Testing
@testable import swift2df

@PlayerEvent.Join
func onJoin(player: Selection<Player>) -> PlayerEvent {
    player.kick()
}

@PlayerEvent.Quit
func onQuit(player: Selection<Player>) -> PlayerEvent {
    player.kick()
}

@Test func main() {
    compile(onJoin, onQuit)
}