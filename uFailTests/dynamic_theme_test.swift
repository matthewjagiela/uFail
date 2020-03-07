//
//  dynamic_theme_test.swift
//  uFailTests
//
//  Created by Matthew Jagiela on 3/6/20.
//  Copyright © 2020 Matthew Jagiela. All rights reserved.
//

import UIKit
import XCTest

class dynamic_theme_test: XCTestCase {
    var handler = DynamicTheme()
    let calendar = Calendar.current
    func test_month() {
        let month = calendar.component(.month, from: Date())
        XCTAssertNotNil(month)
        print("Test month = \(month)")
    }
}
