// swiftlint:disable all
// Created by Jamal alayq
// gamalal3yk@gmail.com


import Foundation

public struct Email: ExpressibleByStringLiteral, CustomStringConvertible {
    
    public let address: String
    
    public init(stringLiteral value: String) {
        self = Email(address: value)
    }
    
    public init(address: String) {
        self.address = address
    }
    
    public var description: String { "Email value is: \(address)" }
    
    public var isValid: Bool {
        let pattern = #"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[A-Z0-9.-]+\.[A-Z]{2,}$"#
        let regex = try? NSRegularExpression(pattern: pattern, options: [.caseInsensitive])
        let matches = regex?.matches(
            in: address,
            options: [.anchored],
            range: .init(location: 0, length: address.count)
            ) ?? []
        return !matches.isEmpty
    }
    
}

// MARK:- Hashing

extension Email: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(address)
    }
    
}

// MARK:- Equatability

extension Email: Equatable {
    
    public static func == (lhs: Email, rhs: Email) -> Bool {
        return lhs.address == rhs.address && lhs.isValid && rhs.isValid
    }
    
}


// MARK:- Codability

extension Email: Codable {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        address = try container.decode(String.self)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(address)
    }
    
}
