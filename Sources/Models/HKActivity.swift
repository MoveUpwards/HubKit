//
//  HKActivity.swift
//  HubKit
//
//  Created by Loïc GRIFFIE on 24/09/2018.
//  Copyright © 2018 Loïc GRIFFIE. All rights reserved.
//

import Foundation

/// HKActivity represents an activity a session can be associated with
final public class HKActivity: Decodable {
    /// The unique identifier
    public var identifier: String = ""
    /// The activity name
    public var name: String?
}

extension HKActivity {
    enum CodingKeys: String, CodingKey {
        case identifier
        case name
    }

    convenience public init(from decoder: Decoder) throws {
        self.init()

        let values = try decoder.container(keyedBy: CodingKeys.self)
        if let identifier = try values.decodeIfPresent(String.self, forKey: .identifier) {
            self.identifier = identifier
        }
        if let name = try values.decodeIfPresent(String.self, forKey: .name) {
            self.name = name
        }
    }
}
