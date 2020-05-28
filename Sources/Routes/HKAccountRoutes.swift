//
//  HKAccountRoutes.swift
//  HubKit
//
//  Created by Loïc GRIFFIE on 24/09/2018.
//  Copyright © 2018 Loïc GRIFFIE. All rights reserved.
//

import Alamofire
import Foundation

extension HKAccount {
    /// Get the current authenticated user
    public static func me<T: Decodable>(completion: @escaping (Result<T, AFError>) -> Void) {
        Hubkit.default.get(action: "me", completion: completion)
    }
}
