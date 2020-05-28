//
//  HKTokenRoutes.swift
//  Alamofire
//
//  Created by Loïc GRIFFIE on 24/09/2018.
//

import Alamofire
import Foundation

extension HKJwtToken {
    /// Authenticate a user and get a HKToken with a jwt token
    public static func authenticate<T: Decodable>(username: String,
                                                  password: String,
                                                  completion: @escaping (Result<T, AFError>) -> Void) {
        let parameters: [String: String] = [
            "_username": username,
            "_password": password
        ]

        Hubkit.default.post(action: "login_check",
                               parameters: parameters,
                               encoder: URLEncodedFormParameterEncoder.default,
                               completion: completion)
    }

    /// Logout the current user being login in with JWT token authentication method
    public static func logout() {
        Hubkit.default.set(jwt: nil)
    }
}
