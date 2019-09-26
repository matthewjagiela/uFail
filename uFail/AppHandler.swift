//
//  AppHandler.swift
//  uFail
//
//  Created by Matthew Jagiela on 9/25/19.
//  Copyright © 2019 Matthew Jagiela. All rights reserved.
//

import UIKit

class AppHandler: NSObject {
    @objc func getAppVersion() -> String {
        return "Currently Running Version 11"
    }
    @objc func changes() -> String {
        if let path = Bundle.main.path(forResource: "Changes", ofType: "txt") {

            if let contents = try? String(contentsOfFile: path) {

                return contents

            } else {

                print("Error! - This file doesn't contain any text.")
            }

        } else {

            print("Error! - This file doesn't exist.")
        }

        return ""

    }
}
