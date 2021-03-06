//
//  HKDeviceRoutes.swift
//  HubKit
//
//  Created by Loïc GRIFFIE on 25/09/2018.
//  Copyright © 2018 Loïc GRIFFIE. All rights reserved.
//

import Alamofire
import Foundation

extension HKDevice {
    /// Get the device for the given identifier
    public static func get<T: Decodable>(identifier: String, completion: @escaping (Result<T, AFError>) -> Void) {
        Hubkit.default.get(action: "devices/\(identifier)", completion: completion)
    }

    /// Create a new session
    public static func create<T: Decodable>(device: HKDevice, completion: @escaping (Result<T, AFError>) -> Void) {
        let parameters = HKDeviceParameters(name: device.name ?? "",
                                            macAddress: device.macAddress ?? "",
                                            hardwareVersion: device.hardwareVersion ?? "",
                                            firmwareVersion: device.firmwareVersion ?? "",
                                            manualMode: device.manualMode,
                                            sensorType: device.sensorType ?? "",
                                            battery: device.battery ?? 0,
                                            latitude: device.latitude ?? 0.0,
                                            longitude: device.longitude ?? 0.0)
        Hubkit.default.post(action: "devices", parameters: parameters, completion: completion)
    }

    /// Activate a device for the given identifier
    public func update<T: Decodable>(_ parameters: [String: String], completion: @escaping (Result<T, AFError>) -> Void) {
        Hubkit.default.patch(action: "devices/\(identifier)", parameters: parameters, completion: completion)
    }

    /// Activate a device for the given identifier
    public func activate<T: Decodable>(completion: @escaping (Result<T, AFError>) -> Void) {
        let parameters: [String: String] = [:]
        Hubkit.default.patch(action: "devices/\(identifier)/activate", parameters: parameters, completion: completion)
    }
}
