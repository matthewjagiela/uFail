//
//  ThemeTest.swift
//  uFailTests
//
//  Created by Matthew Jagiela on 12/29/19.
//  Copyright © 2019 Matthew Jagiela. All rights reserved.
//

import UIKit
import XCTest

class ThemeTest: XCTestCase {
    func test_BG_Image() {
        let testImage = UIImage(named: "blueBG.png")
        let savedData = DataHandler()
        savedData.saveTheme(theme: "blue")
        let theme = ThemeHandler()
        XCTAssertEqual(testImage, theme.getBackgroundImage())
    }
    func test_Button_Image() {
        let testImage = UIImage(named: "blueButton.png") ?? UIImage()
        let savedData = DataHandler()
        savedData.saveTheme(theme: "blue")
        let theme = ThemeHandler()
        XCTAssertEqual(testImage, theme.getFailButton())
    }
}
