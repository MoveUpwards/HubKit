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
    /// The device activation date
    public var activatedAt: Date?
}

extension HKDevice {
    enum CodingKeys: String, CodingKey {
        case identifier
        case externalUUID = "externalIdentifier"
        case name
        case macAddress
        case hardwareVersion
        case firmwareVersion
        case manualMode
        case latitude
        case longitude
        case sensorType
        case battery
        case activated
        case activatedAt = "activatedAt"
    }

    // swiftlint:disable cyclomatic_complexity
    convenience public init(from decoder: Decoder) throws {
        self.init()

        let values = try decoder.container(keyedBy: CodingKeys.self)
        if let identifier = try values.decodeIfPresent(String.self, forKey: .identifier) {
            self.identifier = identifier
        }
        if let externalUUID = try values.decodeIfPresent(String.self, forKey: .externalUUID) {
            self.externalUUID = externalUUID
        }
        if let name = try values.decodeIfPresent(String.self, forKey: .name) {
            self.name = name
        }
        if let macAddress = try values.decodeIfPresent(String.self, forKey: .macAddress) {
            self.macAddress = macAddress
        }
        if let hardwareVersion = try values.decodeIfPresent(String.self, forKey: .hardwareVersion) {
            self.hardwareVersion = hardwareVersion
        }
        if let firmwareVersion = try values.decodeIfPresent(String.self, forKey: .firmwareVersion) {
            self.firmwareVersion = firmwareVersion
        }
        if let manualMode = try values.decodeIfPresent(Bool.self, forKey: .manualMode) {
            self.manualMode = manualMode
        }
        if let latitude = try values.decodeIfPresent(Double.self, forKey: .latitude) {
            self.latitude = latitude
        }
        if let longitude = try values.decodeIfPresent(Double.self, forKey: .longitude) {
            self.longitude = longitude
        }
        if let sensorType = try values.decodeIfPresent(String.self, forKey: .sensorType) {
            self.sensorType = sensorType
        }
        if let battery = try values.decodeIfPresent(Int.self, forKey: .battery) {
            self.battery = battery
        }
        if let activated = try values.decodeIfPresent(Bool.self, forKey: .activated) {
            self.activated = activated
        }
        if let activatedAt = try values.decodeIfPresent(Date.self, forKey: .activatedAt) {
            self.activatedAt = activatedAt
        }
    }
}
