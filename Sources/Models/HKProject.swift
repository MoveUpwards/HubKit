//
//  HKProject.swift
//  HubKit
//
//  Created by Loïc GRIFFIE on 26/09/2018.
//  Copyright © 2018 Loïc GRIFFIE. All rights reserved.
//

import Foundation

/// A container grouping a set of Session representing measurement campaigns.
final public class HKProject: Codable {
    /// The unique identifier
    public var identifier: String = ""
    /// The project name
    public var name: String?
    /// The activity unique identifier the session is associated with
    public var activity: HKActivity?
    /// The project attached devices
    public var devices = [HKDevice]()
}

extension HKProject {
    enum CodingKeys: String, CodingKey {
        case identifier
        case name
        case activity
        case devices
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
        if let activity = try values.decodeIfPresent(HKActivity.self, forKey: .activity) {
            self.activity = activity
        }
        if let devices = try values.decodeIfPresent([HKDevice].self, forKey: .devices) {
            self.devices = devices
        }
    }
}
