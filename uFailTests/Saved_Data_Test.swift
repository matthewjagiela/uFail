//
//  saved_data_test.swift
//  uFailTests
//
//  Created by Matthew Jagiela on 12/28/19.
//  Copyright © 2019 Matthew Jagiela. All rights reserved.
//

import UIKit
import XCTest

class Saved_Data_Test: XCTestCase {
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
    
    func testThankYou() {
        let savedData = DataHandler()
        XCTAssertFalse(savedData.thankYouMessageViewed())
        savedData.setThankYouMessageViewed()
        XCTAssertTrue(savedData.thankYouMessageViewed())
    }
}
class iCloud_Data_Test: XCTestCase {
    func testiCloud() {
        iCloudHandler.storeFailCount(10)
        XCTAssertEqual(10, iCloudHandler.getFailCount())
    }
}
