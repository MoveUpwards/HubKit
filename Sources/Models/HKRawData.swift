//
//  HKRawData.swift
//  HubKit
//
//  Created by Loïc GRIFFIE on 24/09/2018.
//  Copyright © 2018 Loïc GRIFFIE. All rights reserved.
//

import Foundation

/// HKRawData represents the data captured by a Sensor
public struct HKRawData: Decodable {
    /// The unique identifier
    public let id: String

    /// The device unique identifier the raw data come from
    public let device: String?

    /// The session unique identifier the raw data is associated with
    public let session: String?

    public init(id: String = UUID().uuidString, device: String? = nil, session: String? = nil) {
        self.id = id
        self.device = device
        self.session = session
    }
}

extension HKRawData {
    enum CodingKeys: String, CodingKey {
        case id = "identifier"
        case device
        case session
    }
}

extension HKRawData: Identifiable {}

extension HKRawData: CustomStringConvertible {
    public var description: String {
        "<HKRawData id: \(id)>"
    }
}
