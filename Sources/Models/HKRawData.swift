//
//  HKRawData.swift
//  HubKit
//
//  Created by Loïc GRIFFIE on 24/09/2018.
//  Copyright © 2018 Loïc GRIFFIE. All rights reserved.
//

import Foundation

/// HKRawData represents the data captured by a Sensor
final public class HKRawData: Decodable {
    /// The unique identifier
    public var identifier: String = ""
    /// The device unique identifier the raw data come from
    public var device: String?
    /// The session unique identifier the raw data is associated with
    public var session: String?
}

extension HKRawData {
    enum CodingKeys: String, CodingKey {
        case identifier
        case device
        case session
    }

    convenience public init(from decoder: Decoder) throws {
        self.init()

        let values = try decoder.container(keyedBy: CodingKeys.self)
        if let identifier = try values.decodeIfPresent(String.self, forKey: .identifier) {
            self.identifier = identifier
        }
        if let device = try values.decodeIfPresent(String.self, forKey: .device) {
            self.device = device
        }
        if let session = try values.decodeIfPresent(String.self, forKey: .session) {
            self.session = session
        }
    }
}
