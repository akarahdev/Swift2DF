import Swift2DFCodegen
import Synchronization

public struct PlayerEvent: Sendable {
    public static func join(_ callable: () -> Void) {
        appendCodeBlock(
            SelectionBlock.playerEvent(
                action: "Join"
            )
        )
        depthScope {
            callable()
        }
    }
}
