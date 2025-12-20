import Foundation
import Gzip

public enum Json: LosslessStringConvertible {
    case object(_ value: [String: Json])
    case array(_ value: [Json])
    case number(_ value: Float64)
    case string(_ value: String)
    case bool(_ value: Bool)
    case null

    public init?(_ description: String) {
        fatalError("unimplemented")
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
           return value[key]!
       }
    }

    subscript(key: Int) -> Json {
        get {
            guard case let .array(value) = self else {
                return .null
            }
            return value[key]
        }
    }
}

public protocol JsonConvertible: Sendable {
    func toJson() -> Json;
}
