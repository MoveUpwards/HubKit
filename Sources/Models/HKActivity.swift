//
//  HKActivity.swift
//  HubKit
//
//  Created by Loïc GRIFFIE on 24/09/2018.
//  Copyright © 2018 Loïc GRIFFIE. All rights reserved.
//

import Foundation

/// HKActivity represents an activity a session can be associated with
public struct HKActivity: Codable {
    /// The unique identifier
    public let id: String

    /// The activity name
    public let name: String

    public init(id: String = UUID().uuidString, name: String) {
        self.id = id
        self.name = name
    }
}

extension HKActivity {
    enum CodingKeys: String, CodingKey {
        case id = "identifier"
        case name
    }
}

extension HKActivity: Identifiable {}

extension HKActivity: CustomStringConvertible {
    public var description: String {
        "<HKActivity id: \(id), name: \(name)>"
    }
}
