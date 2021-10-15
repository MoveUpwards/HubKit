//
//  HKJwtToken.swift
//  Alamofire
//
//  Created by Loïc GRIFFIE on 24/09/2018.
//

import Foundation
import Offenbach

/// An authentication token used to sign API communication
final public class HKJwtToken: TokenProtocol {
    public var refresh: String?
    /// The authentication token
    public var token: String?

    public func apply(to api: Hubkit) {
        api.set(jwt: self)
    }
}

extension HKJwtToken: Decodable {
    enum CodingKeys: String, CodingKey {
        case jwt = "token"
    }

    convenience public init(from decoder: Decoder) throws {
        self.init()

        let values = try decoder.container(keyedBy: CodingKeys.self)
        token = try values.decodeIfPresent(String.self, forKey: .jwt)
    }
}
