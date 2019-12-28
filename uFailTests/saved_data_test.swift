//
//  saved_data_test.swift
//  uFailTests
//
//  Created by Matthew Jagiela on 12/28/19.
//  Copyright © 2019 Matthew Jagiela. All rights reserved.
//

import UIKit
import XCTest

class saved_data_test: XCTestCase {
    func testTheme() {
        let savedData = DataHandler()
        savedData.saveTheme(theme: "Blue")
        XCTAssertEqual("Blue", savedData.getTheme())
        savedData.saveTheme(theme: "Red")
        XCTAssertEqual("Red", savedData.getTheme())
    }
    func testNullTheme() {
        let savedData = DataHandler()
        savedData.defaults.set(nil, forKey: "theme")
        XCTAssertEqual("dynamic", savedData.getTheme())
    }
}
class iCloud_data_test: XCTestCase {
    func testiCloud() {
        iCloudHandler.storeFailCount(10)
        XCTAssertEqual(10, iCloudHandler.getFailCount())
    }
}
