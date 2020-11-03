//
//  App_Handler_Tests.swift
//  uFailTests
//
//  Created by Matthew Jagiela on 1/16/20.
//  Copyright © 2020 Matthew Jagiela. All rights reserved.
//

import UIKit
import XCTest
class App_Handler_Tests: XCTestCase {
    let handler = AppHandler()
    func test_newest_version() {
        handler.labelsFilled { (InternetInformation) in
            XCTAssertNotNil(InternetInformation.uFailVersion)
        }
    }
    func test_uApps_news() {
        handler.labelsFilled { (info) in
            XCTAssertNotNil(info.uAppsNews)
        }
    }
    
    func testThankYouFilled() {
        XCTAssertNotEqual("", handler.thankYouMessage())
    }

}
