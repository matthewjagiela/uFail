//
//  AppDelegate.swift
//  uFail
//
//  Created by Matthew Jagiela on 12/26/19.
//  Copyright © 2019 Matthew Jagiela. All rights reserved.
//

import UIKit
import GoogleMobileAds
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        return true
    }

}
