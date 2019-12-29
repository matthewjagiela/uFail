//
//  DeviceHandler.swift
//  uFail
//
//  Created by Matthew Jagiela on 12/28/19.
//  Copyright © 2019 Matthew Jagiela. All rights reserved.
//

import UIKit

class DeviceHandler: NSObject {
    enum Device {
        case iPhone4
        case iPhone5
        case iPhone6
        case iPhoneX
        case iPhoneXr
        case iPhone6Plus
        case iPhoneMax
        case iPad
    }
    func currentDevice() -> Device {
        let height = Float(UIScreen.main.bounds.size.height)
        let width = Float(UIScreen.main.bounds.size.width)
        let pixels = Int(fmaxf(height, width))
        
        switch pixels {
        case 480:
            return .iPhone4
        case 568:
            return .iPhone5
        case 667:
            return .iPhone6
        case 736:
            return .iPhone6Plus
        case 812:
            return .iPhoneX
        case 896:
            return UIScreen.main.scale > 2.0 ? .iPhoneMax : .iPhoneXr
        default:
            return .iPad
        }
    }
    
}
