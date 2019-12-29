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
        let testImage = UIImage(named: "BlueButton.png") ?? UIImage()
        let savedData = DataHandler()
        savedData.saveTheme(theme: "blue")
        let theme = ThemeHandler()
        XCTAssertEqual(testImage, theme.getFailButton())
    }
    func test_bg_failure() {
        let testImage = UIImage(named: "blueBG.png")
        let savedData = DataHandler()
        savedData.saveTheme(theme: "red")
        let theme = ThemeHandler()
        XCTAssertNotEqual(testImage, theme.getBackgroundImage())
    }
    func test_button_failure() {
        let testImage = UIImage(named: "BlueButton.png")
        let savedData = DataHandler()
        savedData.saveTheme(theme: "red")
        let theme = ThemeHandler()
        XCTAssertNotEqual(testImage, theme.getFailButton())
    }
}
