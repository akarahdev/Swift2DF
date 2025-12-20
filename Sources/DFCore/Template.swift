import WebSocketKit
import NIO
import Dispatch

private enum WebSocketTimeoutError: Error { case timedOut }

public struct CodeTemplateManager {
    var code_lines: [CodeLine] = []
    var generated_code: [[CodeBlock]] = [[]]

    public func findFunction(named: String) -> CodeLine? {
        for line in code_lines {
            if case .function(data: named) = line.getHeader() {
                return line
            }
        }
        return nil
    }
}

nonisolated(unsafe) public var CTM: CodeTemplateManager = CodeTemplateManager()

// SAFETY: this project is entirely singlethreaded lmao

public func appendCodeBlock(_ cb: CodeBlock) {
    CTM.generated_code[CTM.generated_code.endIndex - 1].append(cb)
}

public func codegenScope(function: () -> Void) {
    CTM.generated_code.append([])
    function()
    print()
    print(CodeLine(blocks: CTM.generated_code.last!).toJson().description)
    print()
    CTM.code_lines.append(CodeLine(blocks: CTM.generated_code.removeLast()))
}

public func compile(_ compilables: [() -> Void]) {
    CTM.code_lines = []
    for compilable in compilables {
        codegenScope(function: compilable)
    }

    var jsonStrings: [String] = []
    for action in CTM.code_lines {
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

func installInboundHandler(_ ws: WebSocket, strings: [String]) {
    ws.onText { _, text in
        if text == "auth" {
            var commands: [String] = [
                "clear",
                "mode code",
                "spawn",
                "place"
            ]
            commands.append(contentsOf: strings.map({ str in "place \(str)"}))
            commands.append("place go")
            for cmd in commands {
                print(cmd)
                ws.send(cmd)
            }
        }
        if text == "place done" {
            exit(0)
        }
    }
}
