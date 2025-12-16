import Foundation
import Gzip

public enum Json: LosslessStringConvertible {
    case object(_ value: [Swift.String: Json])
    case array(_ value: [Json])
    case number(_ value: Float64)
    case string(_ value: Swift.String)
    case bool(_ value: Bool)
    case null

    public init?(_ description: Swift.String) {
        fatalError("unimplemented")
    }

    public var description: Swift.String {
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
                return Swift.String(value)
            case .string(let value):
                return "\"\(value.replacing("\"", with: "\\\""))\""
            case .bool(let value):
                return Swift.String(value)
            case .null:
                return "null"
        }
    }

    public var dfExported: String {
        let data = self.description.data(using: .utf8)
        let gzipped = try? data?.gzipped()
        let b64 = gzipped?.base64EncodedData()
        let fin = b64! 
        return Swift.String(data: fin, encoding: .utf8) ?? "errorful"
    }
}

public protocol JsonConvertible: Sendable {
    func toJson() -> Json;
}