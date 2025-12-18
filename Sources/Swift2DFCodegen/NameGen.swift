import Foundation

public struct NameGen {
    public static func generateName() -> String {
        let uuid = UUID().description
        let finalSubstr = uuid[uuid.startIndex...uuid.index(uuid.startIndex, offsetBy: 6)]
        return finalSubstr.description
    }
}
