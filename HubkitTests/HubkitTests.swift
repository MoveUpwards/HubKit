//
//  HubkitTests.swift
//  HubkitTests
//
//  Created by Loïc GRIFFIE on 14/06/2019.
//  Copyright © 2019 Move Upwards. All rights reserved.
//

@testable import Hubkit
import Alamofire
import Offenbach
import XCTest

class HubkitTests: XCTestCase {

    static var allTests = [
        ("testExample", testExample),
    ]

    var apiManager: Hubkit?

    override func setUp() {
        super.setUp()

        apiManager = Hubkit()
        apiManager?.set(config: Config(baseURL: "http://localhost:8080/api/v1"))
    }

    override func tearDown() {
        super.tearDown()
    }

    func testExample() {
        XCTAssertNotNil(apiManager)
    }
}
