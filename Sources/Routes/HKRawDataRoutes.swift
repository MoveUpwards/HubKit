//
//  HKRawDataRoutes.swift
//  HubKit
//
//  Created by Loïc GRIFFIE on 25/09/2018.
//  Copyright © 2018 Loïc GRIFFIE. All rights reserved.
//

import Alamofire
import Foundation

extension HKRawData {
    /// Create a new session
    public static func create<T: Decodable>(in session: HKSession,
                                            _ device: HKDevice,
                                            _ file: HKMultiPart,
                                            progress: @escaping (Double) -> Void,
                                            completion: @escaping (Result<T, Error>) -> Void) {
        let parameters: Parameters = [
            "session": session.identifier,
            "device": device.identifier
        ]
        
        Hubkit.default.upload(action: "raw_datas",
                              parameters: parameters,
                              files: [file],
                              progress: progress,
                              completion: completion)
    }
    
    /// Get the raw data for the given identifier
    public static func get<T: Decodable>(identifier: String, completion: @escaping (Result<T, Error>) -> Void) {
        Hubkit.default.get(action: "raw_datas/\(identifier)", completion: completion)
    }
}
