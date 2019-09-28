//
//  AppHandler.swift
//  uFail
//
//  Created by Matthew Jagiela on 9/25/19.
//  Copyright © 2019 Matthew Jagiela. All rights reserved.
//

import UIKit

class AppHandler: NSObject {
    var internetLines = [String]()
    override init() {
        super.init()
        internetLabels()
    }
    @objc func getAppVersion() -> String {
        return "Currently Running Version 10.5"
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
    @objc func getuFailNewestVersion() -> String {
        return internetLines[0]
    }
    @objc func getuAppsnews() -> String {
        return internetLines[1]
    }
    func internetLabels() {
        if let url = URL(string: "https://matthewjagiela.github.io/uApps-HTML/") {
            do {
                let contents = try String(contentsOf: url)
                let newLineSet = NSCharacterSet.newlines
                let lines = contents.components(separatedBy: newLineSet)
                internetLines.append(lines[0])
                internetLines.append(lines[4])
            } catch {
                // contents could not be loaded
            }
        } else {
            // the URL was bad!
        }
    }
}
