import Swift2DFCodegen
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

    public static func parameterized<T1: Expression>(_ arg1: T1, _ callable: (T1) -> Void) {
        let prevSymbol = Thread.callStackSymbols[1]

        let param1Name = "s2df.param.\(NameGen.generateName())"
        let param1Param = ParameterElementVarItem(name: param1Name, type: arg1.parameterElementType)
        let param1Var = VariableVarItem(name: param1Name, scope: "line")

        createFunction(
            named: prevSymbol,
            functionArgs: [
                0 : param1Param
            ],
            callingArgs: [
                0 : arg1.varItem
            ],
            callable: {
                callable(T1(varItem: param1Var))
            }
        )
    }

    public static func createFunction(named: Swift.String, functionArgs: [Int : any VarItem] = [:], callingArgs: [Int : any VarItem] = [:], callable: () -> Void) {
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
        appendCodeBlock(
            SelectionBlock.callFunction(
                data: named,
                args: callingArgs
            )
        )
    }
}
