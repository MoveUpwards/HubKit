//
//  HKDevice.swift
//  HubKit
//
//  Created by Damien Noël Dubuisson on 24/09/2018.
//  Copyright © 2018 Loïc GRIFFIE. All rights reserved.
//

import Foundation

/// A physical device containing a set of electronic components for measurements (Sensors)
public struct HKDevice: Codable {
    /// The unique identifier
    public let id: String

    /// The name of the device
    public let externalUUID: String?

    /// The name of the device
    public let name: String?

    /// The MAC address of the device
    public let macAddress: String?

    /// The hardware version of the device
    public let hardwareVersion: String?

    /// The firmware version of the device
    public let firmwareVersion: String?

    /// Is the device start recording data manually
    public let manualMode: Bool

    /// The latitude of the device position
    public let latitude: Double?

    /// The longitude of the device position
    public let longitude: Double?

    /// The device type
    public let sensorType: String?

    /// The device battery level in percentile
    public let battery: Int?

    /// Is the device being activated
    public let activated: Bool

    /// The device activation date
    public let activatedAt: Date?

    public init(id: String = UUID().uuidString,
                externalUUID: String? = nil,
                name: String? = nil,
                macAddress: String? = nil,
                hardwareVersion: String? = nil,
                firmwareVersion: String? = nil,
                latitude: Double? = nil,
                longitude: Double? = nil,
                sensorType: String? = nil,
                battery: Int? = nil,
                manualMode: Bool = false,
                activated: Bool = false,
                activatedAt: Date? = nil) {
        self.id = id
        self.externalUUID = externalUUID
        self.name = name
        self.macAddress = macAddress
        self.hardwareVersion = hardwareVersion
        self.firmwareVersion = firmwareVersion
        self.latitude = latitude
        self.longitude = longitude
        self.sensorType = sensorType
        self.battery = battery
        self.manualMode = manualMode
        self.activated = activated
        self.activatedAt = activatedAt
    }
}

extension HKDevice {
    enum CodingKeys: String, CodingKey {
        case id = "identifier"
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
}

extension HKDevice: Identifiable {}

extension HKDevice: CustomStringConvertible {
    public var description: String {
        "<HKDevice id: \(id), activated: \(activated)>"
    }
}
