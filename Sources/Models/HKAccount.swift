//
//  HKAccount.swift
//  HubKit
//
//  Created by Loïc GRIFFIE on 24/09/2018.
//  Copyright © 2018 Loïc GRIFFIE. All rights reserved.
//

import Foundation

/// An authenticated user account representation
final public class HKAccount: Decodable {
    /// The unique identifier
    public var identifier: String = ""
    /// The authenticated user email adress
    public var email: String?
    /// The authenticated user projects
    public var projects = [HKProject]()
}

extension HKAccount {
    enum CodingKeys: String, CodingKey {
        case identifier
        case email
        case projects
    }

    convenience public init(from decoder: Decoder) throws {
        self.init()

        let values = try decoder.container(keyedBy: CodingKeys.self)
        if let identifier = try values.decodeIfPresent(String.self, forKey: .identifier) {
            self.identifier = identifier
        }
        if let email = try values.decodeIfPresent(String.self, forKey: .email) {
            self.email = email
        }
        if let projects = try values.decodeIfPresent([HKProject].self, forKey: .projects) {
            self.projects = projects
        }
    }
}
