public struct LocVarItem : VarItem {
    public let x: Float64
    public let y: Float64
    public let z: Float64
    public let pitch: Float64
    public let yaw: Float64

    public init(x: Float64, y: Float64, z: Float64, pitch: Float64, yaw: Float64) {
        self.x = x
        self.y = y
        self.z = z
        self.pitch = pitch
        self.yaw = yaw
    }

    public func toJson() -> Json {
        return .object([
            "id": .string("loc"),
            "data": .object([
                "isBlock": .bool(false),
                "loc": .object([
                    "x": .number(self.x),
                    "y": .number(self.y),
                    "z": .number(self.z),
                    "pitch": .number(self.pitch),
                    "yaw": .number(self.yaw)
                ])
            ])
        ])
    }
}
