//
//  AppDelegate.swift
//  uFail
//
//  Created by Matthew Jagiela on 12/26/19.
//  Copyright © 2019 Matthew Jagiela. All rights reserved.
//

import UIKit
import GoogleMobileAds
import SideMenuSwift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        _ = AppHandler()
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        // MARK: - Side Menu Preferences
        SideMenuController.preferences.basic.menuWidth = 260
        SideMenuController.preferences.basic.position = .under
        return true
    }

}
