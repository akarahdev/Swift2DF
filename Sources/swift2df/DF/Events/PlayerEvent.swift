import Synchronization

public struct PlayerEvent: Sendable {
    let event: Swift.String;
    let contents: [Expression];

    static func join(_ callable: () -> Void) {
        GENERATED_CODE.append(SelectionBlock(
            block: "event", 
            action: "Join", 
            target: "", 
            attribute: "", 
            args: [:]
        ))
        callable()
    }
}