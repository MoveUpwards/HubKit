//
//  HKAccount.swift
//  HubKit
//
//  Created by Loïc GRIFFIE on 24/09/2018.
//  Copyright © 2018 Loïc GRIFFIE. All rights reserved.
//

import Foundation

/// An authenticated user account representation
public struct HKAccount: Codable {
    /// The unique identifier
    public let id: String

    /// The authenticated user email adress
    public let email: String

    /// The authenticated user projects
    public let projects: [HKProject]

    public init(id: String = UUID().uuidString, email: String, projects: [HKProject] = []) {
        self.id = id
        self.email = email
        self.projects = projects
    }
}

extension HKAccount {
    enum CodingKeys: String, CodingKey {
        case id = "identifier"
        case email
        case projects
    }
}

extension HKAccount: Identifiable {}

extension HKAccount: CustomStringConvertible {
    public var description: String {
        "<HKAccount id: \(id), email: \(email)>"
    }
}
