import WebSocketKit
import NIO
import Dispatch

public protocol CompilableArgument {
    static func generateDefaultValue() -> Self;
}

extension Selection<Player>: CompilableArgument {
    public static func generateDefaultValue() -> Selection<K> {
        return Selection()
    }
}

private enum WebSocketTimeoutError: Error { case timedOut }



// SAFETY: this project is entirely singlethreaded lmao
nonisolated(unsafe) public var GENERATED_CODE: [CodeBlock] = []

public func compile(_ compilables: (() -> Void)...) {
    var actions: [CodeLine] = []
    for compilable in compilables {
        GENERATED_CODE = []
        compilable()
        actions.append(CodeLine(blocks: GENERATED_CODE))
    }

    var jsonStrings: [Swift.String] = []
    for action in actions {
        jsonStrings.append(action.toJson().dfExported)
    }

    let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
    let client = WebSocketClient(eventLoopGroupProvider: .shared(group))

    let finalStrings = jsonStrings

    let closePromise = group.next().makePromise(of: Void.self)

    let connectionFut = client.connect(scheme: "ws", host: "localhost", port: 31375, onUpgrade: { ws in 
        ws.onClose.whenComplete { _ in
            closePromise.succeed(())
        }
        installInboundHandler(ws, strings: finalStrings)
        ws.send("scopes movement read_plot write_code clear_plot")
    })

    do {
        try connectionFut.wait()
    } catch {
        print("Connection failed: \(error)")
        try? group.syncShutdownGracefully()
        return
    }

    do {
        _ = try closePromise.futureResult.wait()
    } catch {
        print("Waiting for close failed: \(error)")
    }

    
}

func installInboundHandler(_ ws: WebSocket, strings: [Swift.String]) {
    ws.onText { _, text in
        if text == "auth" {
            var commands: [Swift.String] = [
                "mode code",
                "place"
            ]
            commands.append(contentsOf: strings.map({ str in "place \(str)"}))
            commands.append("place go")
            for cmd in commands {
                ws.send(cmd)
            }
        }
        if text == "place done" {
            exit(0)
        }
    }
}