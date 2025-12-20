import DFCore
import Foundation

extension Function {
    public static func make<
        T1: Expression,
        T2: Expression,
        T3: Expression
    >(
        function: Swift.String = #function,
        fileName: Swift.String = #file,
        line: Int = #line,
        _ arg1: T1,
        _ arg2: T2,
        _ arg3: T3,
        _ callable: (T1, T2, T3) -> Void
    ) {
        let arguments: [Expression] = [arg1, arg2, arg3]
        let bundles = arguments.map { ParameterBundle.make($0) }

        Function.createFunction(
            named: formatDebugInfo(function, fileName, line),
            functionArgs: Swift.Dictionary(uniqueKeysWithValues: zip(0..., bundles.map { $0.param })),
            callingArgs: Swift.Dictionary(uniqueKeysWithValues: zip(0..., bundles.map { $0.val.varItem })),
            callable: {
                appendCodeBlock(
                    SelectionBlock.setVar(
                        action: "AppendValue",
                        args: [
                            0: VariableVarItem(name: "s2df.backtrace", scope: "local"),
                            1: StringVarItem(name: formatDebugInfo(function, fileName, line))
                        ]
                    )
                )
                callable(
                    T1(varItem: bundles[0].variable),
                    T2(varItem: bundles[1].variable),
                    T3(varItem: bundles[2].variable)
                )
                appendCodeBlock(
                    SelectionBlock.setVar(
                        action: "PopListValue",
                        args: [
                            0: VariableVarItem(name: "s2df.null", scope: "line"),
                            1: VariableVarItem(name: "s2df.backtrace", scope: "local")
                        ]
                    )
                )
            }
        )
    }
}
