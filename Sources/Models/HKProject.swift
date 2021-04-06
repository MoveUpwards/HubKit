//
//  HKProject.swift
//  HubKit
//
//  Created by Loïc GRIFFIE on 26/09/2018.
//  Copyright © 2018 Loïc GRIFFIE. All rights reserved.
//

import Foundation

/// A container grouping a set of Session representing measurement campaigns.
public struct HKProject: Codable {
    /// The unique identifier
    public let id: String

    /// The project name
    public let name: String

    /// The activity unique identifier the session is associated with
    public let activity: HKActivity

    /// The project attached devices
    public let devices: [HKDevice]

    public init(id: String = UUID().uuidString, name: String, activity: HKActivity, devices: [HKDevice] = []) {
        self.id = id
        self.name = name
        self.activity = activity
        self.devices = devices
    }
}

extension HKProject {
    enum CodingKeys: String, CodingKey {
        case id = "identifier"
        case name
        case activity
        case devices
    }
}

extension HKProject: Identifiable {}

extension HKProject: CustomStringConvertible {
    public var description: String {
        "<HKProject id: \(id), name: \(name), activity: \(activity)>"
    }
}
