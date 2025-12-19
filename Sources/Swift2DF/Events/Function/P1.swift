import Swift2DFCodegen
import Foundation

extension Function {
    public static func make<T1: Expression>(fileName: Swift.String = #file, line: Int = #line, _ arg1: T1, _ callable: (T1) -> Void) {
        let prevSymbol = "\(fileName):\(line)"

        let param1Name = "s2df.param.\(NameGen.generateName())"
        let param1Param = ParameterElementVarItem(name: param1Name, type: arg1.parameterElementType)
        let param1Var = VariableVarItem(name: param1Name, scope: "line")

        Function.createFunction(
            named: prevSymbol,
            functionArgs: [
                0 : param1Param
            ],
            callingArgs: [
                0 : arg1.varItem
            ],
            callable: {
                appendCodeBlock(
                    SelectionBlock.setVar(
                        action: "AppendValue",
                        args: [
                            0: VariableVarItem(name: "s2df.backtrace", scope: "local"),
                            1: StringVarItem(name: prevSymbol)
                        ]
                    )
                )
                callable(T1(varItem: param1Var))
                appendCodeBlock(
                    SelectionBlock.setVar(
                        action: "PopListValue",
                        args: [
                            0: VariableVarItem(name: "s2df.backtrace", scope: "local")
                        ]
                    )
                )
            }
        )
    }
}
