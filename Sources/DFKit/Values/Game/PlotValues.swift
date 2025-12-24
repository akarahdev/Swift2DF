import DFCore

public extension Game {
    static func playerCount() -> Number {
        return Number(varItem: GameTagVarItem(tagType: "Player Count", target: "Default"))
    }
}
