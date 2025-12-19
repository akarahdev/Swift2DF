import Swift2DFCodegen
import Synchronization

public struct PlayerEvent: Sendable {
    public static func join(
        fileName: Swift.String = #file,
        line: Int = #line,
        _ callable: (Selection<Player>) -> Void
    ) {
        appendCodeBlock(
            SelectionBlock.playerEvent(
                action: "Join"
            )
        )
        appendCodeBlock(
            SelectionBlock.setVar(
                action: "AppendValue",
                args: [
                    0: VariableVarItem(name: "s2df.backtrace", scope: "local"),
                    1: StringVarItem(name: "\(fileName):\(line)")
                ]
            )
        )
        depthScope {
            callable(Selection.defaultPlayer())
        }
    }

    public static func leave(
        fileName: Swift.String = #file,
        line: Int = #line,
        _ callable: (Selection<Player>) -> Void
    ) {
        appendCodeBlock(
            SelectionBlock.playerEvent(
                action: "Leave"
            )
        )
        appendCodeBlock(
            SelectionBlock.setVar(
                action: "AppendValue",
                args: [
                    0: VariableVarItem(name: "s2df.backtrace", scope: "local"),
                    1: StringVarItem(name: "\(fileName):\(line)")
                ]
            )
        )
        depthScope {
            callable(Selection.defaultPlayer())
        }
    }

    public static func sneak(
        fileName: Swift.String = #file,
        line: Int = #line,
        _ callable: (Selection<Player>) -> Void
    ) {
        appendCodeBlock(
            SelectionBlock.playerEvent(
                action: "Sneak"
            )
        )
        appendCodeBlock(
            SelectionBlock.setVar(
                action: "AppendValue",
                args: [
                    0: VariableVarItem(name: "s2df.backtrace", scope: "local"),
                    1: StringVarItem(name: "\(fileName):\(line)")
                ]
            )
        )
        depthScope {
            callable(Selection.defaultPlayer())
        }
    }
}
