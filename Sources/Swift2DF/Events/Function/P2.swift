import Swift2DFCodegen
import Foundation

extension Function {
    public static func make<
        T1: Expression,
        T2: Expression
    >(
        _ arg1: T1,
        _ arg2: T2,
        _ callable: (T1, T2) -> Void
    ) {
        let prevSymbol = Thread.callStackSymbols[1]

        let arguments: [Expression] = [arg1, arg2]
        let bundles = arguments.map { ParameterBundle.make($0) }

        Function.createFunction(
            named: prevSymbol,
            functionArgs: Swift.Dictionary(uniqueKeysWithValues: zip(0..., bundles.map { $0.param })),
            callingArgs: Swift.Dictionary(uniqueKeysWithValues: zip(0..., bundles.map { $0.val.varItem })),
            callable: {
                callable(
                    T1(varItem: bundles[0].variable),
                    T2(varItem: bundles[1].variable)
                )
            }
        )
    }
}
