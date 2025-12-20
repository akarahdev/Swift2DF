import Foundation
import Gzip

public struct JsonParser {
    let str: [Character]
    var idx: Int

    init(string: String) {
        self.str = Array(string.filter {
            $0.isASCII
        })
        self.idx = 0
    }

    mutating func peek() -> Character {
        if idx >= str.count {
            return "?"
        }
        return str[idx]
    }

    mutating func next() -> Character {
        if idx + 1 >= str.count {
            return "?"
        }
        idx += 1
        return str[idx-1]
    }

    @discardableResult
    mutating func assertNext(_ ch: Character) -> Character {
        let n = next()
        assert(n == ch)
        return n
    }

    mutating func parseArray() -> [Json] {
        var arr: [Json] = []
        assertNext("[")
        while true {
            if peek() == "]" {
                assertNext("]")
                break
            }
            let elem = parseJsonElement()!
            arr.append(elem)
            if peek() == "," {
                assertNext(",")
                continue
            }
        }
        return arr
    }

    mutating func parseObject() -> [String : Json] {
        var arr: [String : Json] = [:]
        assertNext("{")
        while true {
            if peek() == "}" {
                assertNext("}")
                break
            }
            let key = parseString()
            assertNext(":")
            let value = parseJsonElement()!
            arr[key] = value
            if peek() == "," {
                assertNext(",")
                continue
            }
            if peek() == "}" {
                assertNext("}")
                break
            }
        }
        return arr
    }

    mutating func parseNumber() -> Double {
        var sb = ""
        while "0123456789-.".contains(peek()) {
            sb.append(next())
        }
        return Double(sb)!
    }

    mutating func parseBoolean() -> Bool {
        if peek() == "t" {
            assertNext("t")
            assertNext("r")
            assertNext("u")
            assertNext("e")
            return true
        }
        if peek() == "f" {
            assertNext("f")
            assertNext("a")
            assertNext("l")
            assertNext("s")
            assertNext("e")
            return false
        }
        return false
    }

    mutating func parseString() -> String {
        assertNext("\"")
        var sb = ""
        while peek() != "\"" {
            if peek() == "\\" {
                _ = next()
                if peek() == "\"" {
                    sb.append("\"")
                }
                if peek() == "\n" {
                    sb.append("\n")
                }
                _ = next()
            } else {
                sb.append(next())
            }
        }
        assertNext("\"")
        return sb
    }

    mutating func parseJsonElement() -> Json? {
        if peek() == "\"" {
            return .string(parseString())
        }
        if peek() == "{" {
            return .object(parseObject())
        }
        if peek() == "[" {
            return .array(parseArray())
        }
        if "0123456789-.".contains(peek()) {
            return .number(parseNumber())
        }
        if "tf".contains(peek()) {
            return .bool(parseBoolean())
        }
        if "n".contains(peek()) {
            assertNext("n")
            assertNext("u")
            assertNext("l")
            assertNext("l")
            return .null
        }
        print("WARNING: Unknown start \(peek().debugDescription)")
        _ = next()
        return .null
    }
}

public enum Json: LosslessStringConvertible, Sendable {
    case object(_ value: [String: Json])
    case array(_ value: [Json])
    case number(_ value: Float64)
    case string(_ value: String)
    case bool(_ value: Bool)
    case null

    public init?(_ description: String) {
        var parser = JsonParser(string: description)
        self = parser.parseJsonElement()!
    }

    public var description: String {
        switch self {
            case .object(let value):
                var out = "{"
                var idx = 0
                for entry in value {
                    out.append("\"\(entry.key)\"")
                    out.append(": ")
                    out.append(entry.value.description)
                    idx += 1
                    if idx != value.count {
                        out.append(", ")
                    }
                }
                out.append("}")
                return out

            case .array(let value):
                var out = "["
                var idx = 0
                for entry in value {
                    out.append(entry.description)
                    idx += 1
                    if idx != value.count {
                        out.append(", ")
                    }
                }
                out.append("]")
                return out
            case .number(let value):
                return String(value)
            case .string(let value):
                return "\"\(value.replacing("\"", with: "\\\""))\""
            case .bool(let value):
                return String(value)
            case .null:
                return "null"
        }
    }

    public var dfExported: String {
        let data = self.description.data(using: .utf8)
        let gzipped = try? data?.gzipped()
        let b64 = gzipped?.base64EncodedData()
        let fin = b64!
        return String(data: fin, encoding: .utf8) ?? "errorful"
    }

    func asNumber() -> Float64 {
        guard case let .number(value) = self else {
            return 0.0
        }
        return value
    }

    func asString() -> String {
        guard case let .string(value) = self else {
            return ""
        }
        return value
    }

    func asBool() -> Bool {
        guard case let .bool(value) = self else {
            return false
        }
        return value
    }

    func asArray() -> [Json] {
        guard case let .array(value) = self else {
            return []
        }
        return value
    }

    func asObject() -> [String : Json] {
        guard case let .object(value) = self else {
            return [:]
        }
        return value
    }

    subscript(key: String) -> Json {
        get {
           guard case let .object(value) = self else {
               return .null
           }
           return value[key] ?? .null
       }
    }

    subscript(key: Int) -> Json {
        get {
            guard case let .array(value) = self else {
                return .null
            }
            if key >= value.count {
                return .null
            }
            return value[key]
        }
    }
}

public protocol JsonConvertible: Sendable {
    func toJson() -> Json;
}

public protocol JsonCreatible: Sendable {
    init(json: Json)
}
