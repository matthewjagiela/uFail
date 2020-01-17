//
//  AppHandler.swift
//  uFail
//
//  Created by Matthew Jagiela on 9/25/19.
//  Copyright © 2019 Matthew Jagiela. All rights reserved.
//

import UIKit

class AppHandler: NSObject {
    lazy var count = 0
    @objc var internetInfo: InternetInformation?
    override init() {
        super.init()
        if let jsonURL = URL(string: "https://raw.githubusercontent.com/matthewjagiela/uApps-JSON/master/uAppsInfo.json") {
                   URLSession.shared.dataTask(with: jsonURL) { data, _, error in
                       if let fetchedData = data {
                           let decoder = JSONDecoder()
                           do {
                               self.internetInfo = try decoder.decode(InternetInformation.self, from: fetchedData)
                   
                           } catch {
                               print("An Error Has Occured \(error)")
                           }
                       }
                   }.resume()
               }
    }
    @objc func getAppVersion() -> String {
        return "Currently Running Version 10.6.1"
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
        return "Newest Version: \(internetInfo?.uFailVersion ?? "")"
    }
    @objc func getuAppsnews() -> String {
        return internetInfo?.uAppsNews ?? ""
    }
    func labelsFilled(completion: @escaping(InternetInformation) -> Void) {
        if let internetInformation = internetInfo {
            completion(internetInformation)
        } else {
            let timer = Timer(timeInterval: 1.0, target: self, selector: #selector(isFilled), userInfo: nil, repeats: true)
            if count > 5 && !isFilled() {
                timer.invalidate()
                print("ERROR: No JSON")
            } else {
                if let information = internetInfo {
                    completion(information)
                } else { print("ERROR") }
            }
        }
    }
    @objc func isFilled() -> Bool {
        print("Called isFilled")
        if internetInfo != nil {
            return true
        } else {
            count += 1
            return false
            
        }
    }
    
}
open class InternetInformation: NSObject, Decodable {
    @objc public var uFailVersion: String?
    @objc public var uAppsNews: String?
    enum CodingKeys: String, CodingKey {
        case uTimeVersion = "uFail_Version"
        case uAppsNews =  "uApps_News"
    }
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        uFailVersion = try? container.decode(String.self, forKey: .uTimeVersion)
        uAppsNews = try? container.decode(String.self, forKey: .uAppsNews)
    }
}
