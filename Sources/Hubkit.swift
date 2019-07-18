//
//  Hubkit.swift
//  HubKit
//
//  Created by Loïc GRIFFIE on 24/09/2018.
//  Copyright © 2018 Loïc GRIFFIE. All rights reserved.
//

import Alamofire
import Foundation
import Offenbach

/// Responsible for requesting the HubKit API
final public class Hubkit: Client {
    fileprivate(set) var project: HKProject? {
        didSet {
            guard let project = project else {
                print("[HubKit] Got no project > ## KO ##")
                return
            }

            print("[HubKit] Got project > \(project.identifier)")
        }
    }

    public var devices: [HKDevice] {
        return project?.devices ?? []
    }

    public static let `default` = Hubkit()

    internal required init() { }

    /// Define the authentication token use to sign the API call to HubKit
    @discardableResult
    public func set(project: String) -> Self {
        get(action: "projects/\(project)") { [weak self] (result: Result<HKProject, Error>) in
            if case .success(let project) = result {
                self?.project = project
            }
        }

        return self
    }
}
