//
//  DynamicTheme.swift
//  uFail
//
//  Created by Matthew Jagiela on 5/7/19.
//  Copyright © 2019 Matthew Jagiela. All rights reserved.
//

import UIKit

enum Season: String {
    case spring
    case summer
    case fall
    case winter
}

class DynamicTheme: NSObject {

    func getMonth() -> Int {
        let calendar = Calendar.current
        return calendar.component(.month, from: Date()); //This is going to return the current month in a 1-12 format...
    }
    func determineSeason() -> Season { //This is going to use the month to find out the current season.
        let month = getMonth()
        if month >= 3 && month < 6 {
            return .spring
        } else if month >= 6 && month < 9 {
            return .summer
        } else if month >= 9 && month < 12 {
            return .fall
        } else {
            return .winter
        }
        
    }

    func getSwitcherImage() -> UIImage {
        let season = determineSeason()
        switch season {
        case .fall:
            return UIImage(named: "Fall Theme Switcher")!
        case .spring:
            return UIImage(named: "Spring Theme Switcher")!
        case .summer:
            return UIImage(named: "Summer Theme Switcher")!
        default:
            return UIImage()
        }
    }
    
    func determineTheme(device: DeviceHandler.Device) -> UIImage { //This is going to use the other methods and the iPhone version to determine the dynamic theme...
        var themeImage = UIImage()
        let season = determineSeason()
        /*
        4 = 4
        5 = 5
        6 = 6
        61 = 6+
        default iPad
        */
        if season == .spring { //We are going to have a spring theme eventually... Right now it is going to return the summer theme
            switch device {
            case .iPhone4: themeImage = UIImage(named: "Spring Theme SE")!
            case .iPhone5: themeImage = UIImage(named: "Spring Theme SE")!
            case .iPhone6: themeImage = UIImage(named: "Spring Theme 6")!
            case .iPhone6Plus: themeImage = UIImage(named: "Spring Theme Plus")!
            case .iPhoneX: themeImage = UIImage(named: "Spring Theme X")!
            case .iPhoneXr: themeImage = UIImage(named: "Spring Theme Plus")!
            case .iPhoneMax: themeImage = UIImage(named: "Spring Theme Plus")!
            default: themeImage = UIImage(named: "Spring Theme Plus")! //TODO: Change to iPad
            }
        } else if season == .summer {
            switch device {
            case .iPhone4: themeImage = UIImage(named: "Summer Theme SE")!
            case .iPhone5: themeImage = UIImage(named: "Summer Theme SE")!
            case .iPhone6: themeImage = UIImage(named: "Summer Theme 6")!
            case .iPhone6Plus: themeImage = UIImage(named: "Summer Theme Plus")!
            case .iPhoneX: themeImage = UIImage(named: "Summer Theme X")!
            case .iPhoneXr: themeImage = UIImage(named: "Summer Theme Plus")!
            case .iPhoneMax: themeImage = UIImage(named: "Summer Theme Plus")!
            default: themeImage = UIImage(named: "Spring Theme Plus")! //TODO: Change to iPad
            }
        } else if season == .fall {
            switch device {
            case .iPhone4: themeImage = UIImage(named: "Fall Theme SE")!
            case .iPhone5: themeImage = UIImage(named: "Fall Theme SE")!
            case .iPhone6: themeImage = UIImage(named: "Fall Theme 6")!
            case .iPhone6Plus: themeImage = UIImage(named: "Fall Theme Plus")!
            case .iPhoneX: themeImage = UIImage(named: "Fall Theme X")!
            case .iPhoneXr: themeImage = UIImage(named: "Fall Theme Plus")!
            case .iPhoneMax: themeImage = UIImage(named: "Fall Theme Plus")!
            default: themeImage = UIImage(named: "Fall Theme Plus")! //TODO: Change to iPad
            }
        } else { //Winter theme
            switch device {
            case .iPhone4: themeImage = UIImage(named: "Winter Theme SE")!
            case .iPhone5: themeImage = UIImage(named: "Winter Theme SE")!
            case .iPhone6: themeImage = UIImage(named: "Winter Theme 6")!
            case .iPhone6Plus: themeImage = UIImage(named: "Winter Theme Plus")!
            case .iPhoneX: themeImage = UIImage(named: "Winter Theme X")!
            case .iPhoneXr: themeImage = UIImage(named: "Winter Theme Plus")!
            case .iPhoneMax: themeImage = UIImage(named: "Winter Theme Plus")!
            default: themeImage = UIImage(named: "Winter Theme Plus")! //TODO: Change to iPad
            }
        }
        
        return themeImage
    }
    func determineFailButton() -> UIImage { //Great thing is that this does not change based on the device... Find it based on season
        var buttonImage = UIImage()
        let season = determineSeason()
        switch season {
        case .summer:
            buttonImage = UIImage(named: "Summer Button")!
        case .spring:
            buttonImage = UIImage(named: "Spring Button")!
        case .fall:
            buttonImage = UIImage(named: "Fall Button")!
        default:
            print("Holder for Winter")
        }
        return buttonImage
    
    }
}
