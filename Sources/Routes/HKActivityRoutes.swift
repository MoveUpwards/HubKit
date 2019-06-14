//
//  HKActivityRoutes.swift
//  HubKit
//
//  Created by Loïc GRIFFIE on 25/09/2018.
//  Copyright © 2018 Loïc GRIFFIE. All rights reserved.
//

import Alamofire
import Foundation

extension HKActivity {
    /// Get all activities from HubKit
    public static func all<T: Decodable>(completion: @escaping (Result<[T], Error>) -> Void) {
        Hubkit.default.list(action: "activities", completion: completion)
    }

    /// Get the activity for the given identifier
    public static func get<T: Decodable>(identifier: String, completion: @escaping (Result<T, Error>) -> Void) {
        Hubkit.default.get(action: "activities/\(identifier)", completion: completion)
    }
}
