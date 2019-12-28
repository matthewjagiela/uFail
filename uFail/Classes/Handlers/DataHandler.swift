//
//  DataHandler.swift
//  uFail
//
//  Created by Matthew Jagiela on 12/27/19.
//  Copyright © 2019 Matthew Jagiela. All rights reserved.
//

import UIKit

class DataHandler: NSObject {
    //MARK: - Storing
    let defaults = UserDefaults.standard
    func saveTheme(theme: String) { //Red, Green, Blue, Dynamic
        defaults.set(theme, forKey: "theme")
    }
    //MARK: - Retriving
    func getTheme() -> String{
        //Red, Green, Blue, Dynamic
        return defaults.string(forKey: "theme") ?? "dynamic" //If non set make it the dynamic theme 
    }
}

class iCloudHandler: NSObject {
    
}
