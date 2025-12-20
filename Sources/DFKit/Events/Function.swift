import DFCore
import Synchronization
import Foundation

public struct Function: Sendable {
    public init(_ callable: () -> Void) {
        Function.anonymous(callable)
    }

    public static func anonymous(_ callable: () -> Void) {
        let prevSymbol = Thread.callStackSymbols[1]
        createFunction(named: prevSymbol, callable: callable)
    }

    public static func createFunction(
        named: Swift.String,
        functionArgs: [Int : any VarItem] = [:],
        callingArgs: [Int : any VarItem] = [:],
        callable: () -> Void,
        preCalling: () -> Void = {},
        postCalling: () -> Void = {}
    ) {
        if let _ = CTM.findFunction(named: named) {

        } else {
            codegenScope {
                appendCodeBlock(
                    SelectionBlock.function(
                        data: named,
                        args: functionArgs
                    )
                )
                depthScope {
                    callable()
                }
            }
        }
        preCalling()
        appendCodeBlock(
            SelectionBlock.callFunction(
                data: named,
                args: callingArgs
            )
        )
        postCalling()
    }
}
