import DFCore


public extension Selection<Player> {
    func isSneaking() -> Bool {
        return self.conditional(
            action: "IsSneaking",
            args: [:]
        )
    }
}
