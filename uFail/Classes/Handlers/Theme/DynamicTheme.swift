//
//  DynamicTheme.swift
//  uFail
//
//  Created by Matthew Jagiela on 5/7/19.
//  Copyright © 2019 Matthew Jagiela. All rights reserved.
//

import UIKit

class DynamicTheme: NSObject {

  @objc func getTestString() -> NSString {
        return "Hello World"
    }
    func getMonth() -> Int {
        let calendar = Calendar.current
        return calendar.component(.month, from: Date()); //This is going to return the current month in a 1-12 format...
    }
    func determineSeason() -> String { //This is going to use the month to find out the current season.
        let month = getMonth()
        if month >= 3 && month < 6 {
            return "Spring"
        } else if month >= 6 && month < 9 {
            return "Summer"
        } else if month >= 9 && month < 12 {
            return "Fall"
        } else {
            return "Winter"
        }
        
    }
    @objc func determineTheme(iPhoneVersion: Int) -> UIImage { //This is going to use the other methods and the iPhone version to determine the dynamic theme...
        var themeImage = UIImage()
        let season = determineSeason()
        /*
        4 = 4
        5 = 5
        6 = 6
        61 = 6+
        default iPad
        */
        if season == "Spring" { //We are going to have a spring theme eventually... Right now it is going to return the summer theme
            switch iPhoneVersion {
            case 4:
                themeImage = UIImage(named: "iPhone 5 summer.png")!
            case 5:
                themeImage = UIImage(named: "iPhone 5 summer.png")!
            case 6:
                themeImage = UIImage(named: "iPhone 6 Summer.png")!
            case 61:
                themeImage = UIImage(named: "iPhone 6+ Summer.png")!
            default:
                themeImage = UIImage(named: "iPad Image Warm")!
            }
        } else if season == "Summer" {
            switch iPhoneVersion {
            case 4:
                themeImage = UIImage(named: "iPhone 5 summer.png")!
            case 5:
                themeImage = UIImage(named: "iPhone 5 summer.png")!
            case 6:
                themeImage = UIImage(named: "iPhone 6 Summer.png")!
            case 61:
                themeImage = UIImage(named: "iPhone 6+ Summer.png")!
            default:
                themeImage = UIImage(named: "iPad Image Warm")!
            }
        } else if season == "Fall" {
            switch iPhoneVersion {
            case 4:
                themeImage = UIImage(named: "iPhone 5 summer.png")!
            case 5:
                themeImage = UIImage(named: "iPhone 5 summer.png")!
            case 6:
                themeImage = UIImage(named: "iPhone 6 Summer.png")!
            case 61:
                themeImage = UIImage(named: "iPhone 6+ Summer.png")!
            default:
                themeImage = UIImage(named: "iPad Image Warm")!
            }
        } else { //Winter theme
            switch iPhoneVersion {
            case 4:
                themeImage = UIImage(named: "iPhone 4-5.png")!
            case 5:
                themeImage = UIImage(named: "iPhone 4-5.png")!
            case 6:
                themeImage = UIImage(named: "iPhone 6 Background.png")!
            case 61:
                themeImage = UIImage(named: "iPhone 6+ Background.png")!
            default:
                themeImage = UIImage(named: "iPad Winter Background.png")!
            }
        }
        
        return themeImage
    }
    @objc func determineFailButton() -> UIImage { //Great thing is that this does not change based on the device... Find it based on season
        var buttonImage = UIImage()
        let season = determineSeason()
        switch season {
        case "Summer":
            print("Holder for summer")
        case "Spring":
            print("Holder for spring")
        case "Fall":
            print("Holder for Fall")
        default:
            print("Holder for Winter")
        }
        return buttonImage
    
    }
}
