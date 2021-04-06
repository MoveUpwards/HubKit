//
//  HKSession.swift
//  HubKit
//
//  Created by Loïc GRIFFIE on 24/09/2018.
//  Copyright © 2018 Loïc GRIFFIE. All rights reserved.
//

import Foundation

/// A measurement campaign over a given time interval with one or more Devices
public struct HKSession: Decodable {
    /// The unique identifier
    public let id: String

    /// The state ot the session
    public let state: String?

    /// The project unique identifier the session is linked to
    public let project: String?

    /// The project unique identifier the session is linked to
    public let metas: String?

    /// The session captured date
    public let capturedAt: Date?
}

extension HKSession {
    enum CodingKeys: String, CodingKey {
        case id = "identifier"
        case state
        case project
        case metas
        case capturedAt
    }
}

extension HKSession: Identifiable {}

extension HKSession: CustomStringConvertible {
    public var description: String {
        "<HKSession id: \(id)>"
    }
}
