import Swift2DFCodegen
import Synchronization

public struct PlayerEvent: Sendable {
    let event: Swift.String;
    let contents: [Expression];

    public static func join(_ callable: () -> Void) {
        GENERATED_CODE.append(
            SelectionBlock.playerEvent(
                action: "Join"
            )
        )
        depthScope {
            callable()
        }
    }
}