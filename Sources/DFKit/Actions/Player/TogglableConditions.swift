import DFCore


public extension Selection<Player> {
    /// Checks if a player is sneaking.
    func isSneaking() -> Bool {
        return self.conditional(
            action: "IsSneaking",
            args: [:]
        )
    }
}
