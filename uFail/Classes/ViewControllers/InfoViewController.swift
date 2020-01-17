//
//  InfoViewController.swift
//  uFail
//
//  Created by Matthew Jagiela on 1/16/20.
//  Copyright © 2020 Matthew Jagiela. All rights reserved.
//

import UIKit
import SafariServices

class InfoViewController: UIViewController {

    @IBOutlet weak var uFailPrivacyPolicy: UIButton!
    @IBOutlet weak var downloaduTimeButton: UIButton!
    @IBOutlet weak var downloaduSurfButton: UIButton!
    @IBOutlet weak var failCountLabel: UILabel!
    @IBOutlet weak var currentlyRunningVersion: UILabel!
    @IBOutlet weak var newestVersionAvailable: UILabel!
    @IBOutlet weak var supportButton: UIBarButtonItem!
    @IBOutlet weak var homeButton: UIBarButtonItem!
    @IBOutlet weak var uAppsNewsLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    // MARK: - Class Variables
    let info = AppHandler()
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        uAppsNewsLabel.adjustsFontSizeToFitWidth = true
        currentlyRunningVersion.adjustsFontSizeToFitWidth = true
        newestVersionAvailable.adjustsFontSizeToFitWidth = true
        failCountLabel.text = "Fail Count: \(iCloudHandler.getFailCount())"
        
        // Do any additional setup after loading the view.
    }
    func internetLabels() {
        uAppsNewsLabel.text = info.getuAppsnews()
        currentlyRunningVersion.text = info.getAppVersion()
        newestVersionAvailable.text = info.getuFailNewestVersion()
    }
    // MARK: - Actions
    @IBAction func supportTapped(_ sender: Any) {
        if let url = URL(string: "https://uappsios.com/ufail-support") {
            let safari = SFSafariViewController(url: url)
            present(safari, animated: true, completion: nil)
        }
    }
    @IBAction func homeTapped(_ sender: Any) {
    }
    @IBAction func downloaduSurf(_ sender: Any) {
    }
    @IBAction func downloaduTime(_ sender: Any) {
    }
    @IBAction func viewuFailPrivacyPolicy(_ sender: Any) {
        if let url = URL(string: "https://uappsios.com/ufail-privacy-policy") {
            let safari = SFSafariViewController(url: url)
            present(safari, animated: true, completion: nil)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
