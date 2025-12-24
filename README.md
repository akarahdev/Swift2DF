# Swift2DF
Swift2DF is a compiler from certain Swift code to DiamondFire code.

## Types
DF Types have their semantic equivalents:
- `AnyValue`
- `Number` (e.g `5/`, `2.7/`)
- `String` (e.g `"hello"/`)
- `Text`
- `Location`
- `Vector`
- `Item<T>`
- `List`
- `Dictionary<K, V>` (Note only string keys will work correctly at the moment.)

We also have custom types:
- `Selection<Player>`
- `Selection<Entity>`
- `Optional<T>`
- `Reference<T>`
- `Bool`
- `Record`

### Records
```swift
public struct Point: Record {
    public init(dict: Dictionary<String, AnyValue> = Dictionary()) {
        self.dict = dict
    }

    public init() {
        self.x = 0
        self.y = 0
    }

    public var dict: Dictionary<String, AnyValue> = Dictionary()

    var x: Number {
        get {
            return dict["x"].asType(Number.self)
        }
        set(newValue) {
            dict["x"] = newValue.asType(AnyValue.self)
        }
    }

    var y: Number {
        get {
            return dict["y"].asType(Number.self)
        }
        set(newValue) {
            dict["y"] = newValue.asType(AnyValue.self)
        }
    }
}
```
