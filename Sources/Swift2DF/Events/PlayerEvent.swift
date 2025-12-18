import Swift2DFCodegen
import Synchronization

public struct PlayerEvent: Sendable {
    public static func join(_ callable: (Selection<Player>) -> Void) {
        appendCodeBlock(
            SelectionBlock.playerEvent(
                action: "Join"
            )
        )
        depthScope {
            callable(Selection.defaultPlayer())
        }
    }

    public static func leave(_ callable: (Selection<Player>) -> Void) {
        appendCodeBlock(
            SelectionBlock.playerEvent(
                action: "Leave"
            )
        )
        depthScope {
            callable(Selection.defaultPlayer())
        }
    }

    public static func sneak(_ callable: (Selection<Player>) -> Void) {
        appendCodeBlock(
            SelectionBlock.playerEvent(
                action: "Sneak"
            )
        )
        depthScope {
            callable(Selection.defaultPlayer())
        }
    }
}
