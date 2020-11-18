//
//  ThemeTest.swift
//  uFailTests
//
//  Created by Matthew Jagiela on 12/29/19.
//  Copyright © 2019 Matthew Jagiela. All rights reserved.
//

import UIKit
import XCTest

class Theme_Test: XCTestCase {
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
    func test_theme_selection() {
        let testTheme = ThemeHandler.Theme.blue
        let theme = ThemeHandler()
        theme.setTheme(.blue)
        XCTAssertEqual(testTheme, theme.theme)
    }
    func test_number_of_themes() {
        let theme = ThemeHandler()
        XCTAssertEqual(theme.getThemePreview().count, 5)
    }
    func test_setting_theme() {
        let theme = ThemeHandler()
        theme.setTheme(.blue)
        XCTAssertEqual(ThemeHandler.Theme.blue, theme.theme)
        theme.setTheme(.green)
        XCTAssertEqual(ThemeHandler.Theme.green, theme.theme)
        theme.setTheme(.red)
        XCTAssertEqual(ThemeHandler.Theme.red, theme.theme)
        theme.setTheme(.purple)
        XCTAssertEqual(ThemeHandler.Theme.purple, theme.theme)
        theme.setTheme(.dynamic)
        XCTAssertEqual(ThemeHandler.Theme.dynamic, theme.theme)
    }
    func test_theme_index() {
        let theme = ThemeHandler()
        let themeObjects = theme.themeObjects()
        let themePreviews = theme.getThemePreview()
        for (index, object) in themeObjects.enumerated() {
            XCTAssertEqual(theme.getPreviewImage(object), themePreviews[index])
        }
    }
}
