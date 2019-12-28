//
//  saved_data_test.swift
//  uFailTests
//
//  Created by Matthew Jagiela on 12/28/19.
//  Copyright © 2019 Matthew Jagiela. All rights reserved.
//

import UIKit
import XCTest

class saved_data_test: XCTest {
    func testTheme() {
        let savedData = DataHandler()
        savedData.saveTheme(theme: "Blue")
        XCTAssertEqual("Blue", savedData.getTheme())
    }
}
