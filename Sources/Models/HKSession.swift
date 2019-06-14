//
//  HKSession.swift
//  HubKit
//
//  Created by Loïc GRIFFIE on 24/09/2018.
//  Copyright © 2018 Loïc GRIFFIE. All rights reserved.
//

import Foundation

/// A measurement campaign over a given time interval with one or more Devices
final public class HKSession: Decodable {
    /// The unique identifier
    public var identifier: String = ""
    /// The state ot the session
    public var state: String?
    /// The project unique identifier the session is linked to
    public var project: String?
    /// The project unique identifier the session is linked to
    public var metas: String?
    /// The session captured date
    public var capturedAt: Date?
}

extension HKSession {
    enum CodingKeys: String, CodingKey {
        case identifier
        case state
        case project
        case metas
        case capturedAt
    }

    convenience public init(from decoder: Decoder) throws {
        self.init()

        let values = try decoder.container(keyedBy: CodingKeys.self)
        if let identifier = try values.decodeIfPresent(String.self, forKey: .identifier) {
            self.identifier = identifier
        }
        if let state = try values.decodeIfPresent(String.self, forKey: .state) {
            self.state = state
        }
        if let project = try values.decodeIfPresent(String.self, forKey: .project) {
            self.project = project
        }
        if let metas = try values.decodeIfPresent(String.self, forKey: .metas) {
            self.metas = metas
        }
        if let capturedAt = try values.decodeIfPresent(Date.self, forKey: .capturedAt) {
            self.capturedAt = capturedAt
        }
    }
}
