//
//  HKSessionRoutes.swift
//  HubKit
//
//  Created by Loïc GRIFFIE on 25/09/2018.
//  Copyright © 2018 Loïc GRIFFIE. All rights reserved.
//

import Alamofire
import Foundation

extension HKSession {
    /// Create a new session
    public static func create<T: Decodable>(in project: HKProject,
                                            _ metas: [String: Any],
                                            _ capturedAt: Date,
                                            completion: @escaping (Result<T, AFError>) -> Void) {
        Hubkit.default.post(action: "sessions", parameters: project, completion: completion)
    }

    /// Get the session for the given identifier
    public static func get<T: Decodable>(identifier: String, completion: @escaping (Result<T, AFError>) -> Void) {
        let parameters: [String: String] = [:]
        Hubkit.default.get(action: "sessions/\(identifier)", parameters: parameters, completion: completion)
    }

    /// Change a session state to ready
    public func ready<T: Decodable>(completion: @escaping (Result<T, AFError>) -> Void) {
        let parameters: [String: String] = [:]
        Hubkit.default.patch(action: "sessions/\(identifier)/ready", parameters: parameters, completion: completion)
    }
}
