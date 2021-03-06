//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

public class AccidentStatsOrderedSummary: JSONDecodable, JSONEncodable, PrettyPrintable {

    public var accidents: Int?

    public var borough: String?

    public var year: Int?

    public init(accidents: Int? = nil, borough: String? = nil, year: Int? = nil) {
        self.accidents = accidents
        self.borough = borough
        self.year = year
    }

    public required init(jsonDictionary: JSONDictionary) throws {
        accidents = jsonDictionary.json(atKeyPath: "accidents")
        borough = jsonDictionary.json(atKeyPath: "borough")
        year = jsonDictionary.json(atKeyPath: "year")
    }

    public func encode() -> JSONDictionary {
        var dictionary: JSONDictionary = [:]
        if let accidents = accidents {
            dictionary["accidents"] = accidents
        }
        if let borough = borough {
            dictionary["borough"] = borough
        }
        if let year = year {
            dictionary["year"] = year
        }
        return dictionary
    }

    /// pretty prints all properties including nested models
    public var prettyPrinted: String {
        return "\(Swift.type(of: self)):\n\(encode().recursivePrint(indentIndex: 1))"
    }
}
