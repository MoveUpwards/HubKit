//
//  HKDevice.swift
//  HubKit
//
//  Created by Damien Noël Dubuisson on 24/09/2018.
//  Copyright © 2018 Loïc GRIFFIE. All rights reserved.
//

import Foundation

/// A physical device containing a set of electronic components for measurements (Sensors)
public final class HKDevice: Decodable {
    /// The unique identifier
    public var identifier: String = ""
    /// The name of the device
    public var externalUUID: String?
    /// The name of the device
    public var name: String?
    /// The factory test results
    public var factoryTest: String?
    /// The MAC address of the device
    public var macAddress: String?
    /// The hardware version of the device
    public var hardwareVersion: String?
    /// The firmware version of the device
    public var firmwareVersion: String?
    /// Is the device start recording data manually
    public var manualMode: Bool = false
    /// The latitude of the device position
    public var latitude: Double?
    /// The longitude of the device position
    public var longitude: Double?
    /// The device type
    public var sensorType: String?
    /// The device battery level in percentile
    public var battery: Int?
    /// Is the device being activated
    public var activated: Bool = false
}

extension HKDevice {
    enum CodingKeys: String, CodingKey {
        case identifier
        case externalUUID = "externalIdentifier"
        case factoryTest
        case macAddress
        case hardwareVersion
        case firmwareVersion
        case manualMode
        case latitude
        case longitude
        case sensorType
        case battery
        case activated
    }

    convenience public init(from decoder: Decoder) throws {
        self.init()

        let values = try decoder.container(keyedBy: CodingKeys.self)
        if let identifier = try values.decodeIfPresent(String.self, forKey: .identifier) {
            self.identifier = identifier
        }
        if let externalUUID = try values.decodeIfPresent(String.self, forKey: .externalUUID) {
            self.externalUUID = externalUUID
        }
    }
}
