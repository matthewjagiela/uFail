//
//  DataHandler.swift
//  uFail
//
//  Created by Matthew Jagiela on 12/27/19.
//  Copyright © 2019 Matthew Jagiela. All rights reserved.
//

import UIKit

class DataHandler: NSObject {
    // MARK: - Storing
    let defaults = UserDefaults.standard
    func saveTheme(theme: String) { //Red, Green, Blue, Dynamic
        defaults.set(theme, forKey: "theme")
    }
    
    func setThankYouMessageViewed() {
        defaults.set(true, forKey: "thankYou")
    }
    
    func overrideThankYouMessageViewed(override: Bool) {
        defaults.set(override, forKey: "thankYou")
    }
    // MARK: - Retriving
    func getTheme() -> String {
        //Red, Green, Blue, Dynamic
        return defaults.string(forKey: "theme") ?? "dynamic" //If non set make it the dynamic theme
    }
    func thankYouMessageViewed() -> Bool {
        return defaults.bool(forKey: "thankYou")
    }
}

class iCloudHandler: NSObject {
    static let defaults = NSUbiquitousKeyValueStore.default
    // MARK: - Storing
    static func storeFailCount(_ count: Int) {
        defaults.set(count, forKey: "failAmount")
    }
    /*
     Add 1 to the current fail count
     */
    static func addToFailCount() {
        let count = getFailCount()
        defaults.set(count + 1, forKey: "failAmount")
    }
    // MARK: - Fetching
    static func getFailCount() -> Int {
        return (defaults.object(forKey: "failAmount") as? Int ?? 0)
    }
}
