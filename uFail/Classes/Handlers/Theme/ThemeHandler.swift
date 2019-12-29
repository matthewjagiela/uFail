//
//  ThemeHandler.swift
//  uFail
//
//  Created by Matthew Jagiela on 12/28/19.
//  Copyright © 2019 Matthew Jagiela. All rights reserved.
//

import UIKit

class ThemeHandler: NSObject {
    let data = DataHandler()
    var theme: Theme?
    let deviceHandler = DeviceHandler()
    var device: DeviceHandler.Device!
    enum Theme {
        case blue
        case green
        case red
        case purple
        case dynamic
    }
    override init() {
        super.init()
        device = deviceHandler.currentDevice()
        switch data.getTheme() {
        case "blue":
            theme = .blue
        case "green":
            theme = .green
        case "red":
            theme = .red
        case "purple":
            theme = .purple
        default:
            theme = .dynamic
        }
    }
    func getBackgroundImage() -> UIImage {
        if theme != .dynamic {
            switch theme {
            case .blue:
                return UIImage(named: "blueBG.png") ?? UIImage()
            case .green:
                return UIImage(named: "greenBG.png") ?? UIImage()
            case .red:
                return UIImage(named: "redBG.png") ?? UIImage()
            default: //Purple
                return UIImage(named: "purpleBG.png") ?? UIImage()
            }
        } else { //dynamic theme
            
        }
        return UIImage()
    }
    func getFailButton() -> UIImage {
        if theme != .dynamic {
            switch theme {
            case .blue:
                return UIImage(named: "BlueButton.png") ?? UIImage()
            case .green:
                return UIImage(named: "GreenButton.png") ?? UIImage()
            case .red:
                return UIImage(named: "RedButton.png") ?? UIImage()
            default:
                return UIImage(named: "PurpleButton.png") ?? UIImage()
            }
        } else {
            
        }
        return UIImage()
    }
}
