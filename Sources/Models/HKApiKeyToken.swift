//
//  HKApiKeyToken.swift
//  Alamofire
//
//  Created by Loïc GRIFFIE on 24/09/2018.
//

import Foundation
import Offenbach

/// An authentication token used to sign API communication
final public class HKApiKeyToken: TokenProtocol {
    /// The authentication token
    public var token: String?

    /// Initialize a HKToken with Api Key
    public convenience init(apiKey: String) {
        self.init()
        self.token = apiKey
    }

    public func apply(to api: Hubkit) {
        api.set(apiKey: self)
    }
}
