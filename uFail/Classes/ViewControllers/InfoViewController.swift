//
//  InfoViewController.swift
//  uFail
//
//  Created by Matthew Jagiela on 1/16/20.
//  Copyright © 2020 Matthew Jagiela. All rights reserved.
//

import UIKit
import SafariServices
import GoogleMobileAds
class InfoViewController: UIViewController {

    @IBOutlet weak var bannerAd: GADBannerView!
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
        uAppsNewsLabel.text = "Loading..."
        newestVersionAvailable.text = "Loading..."
        currentlyRunningVersion.text = info.getAppVersion()
        bannerAd.adUnitID = "ca-app-pub-7714978111013265/9368677969"
        bannerAd.rootViewController = self
        bannerAd.load(GADRequest())
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        info.labelsFilled { (info) in
            self.uAppsNewsLabel.text = "uApps News: \(info.uAppsNews ?? "Thank You For Using uFail")"
            self.newestVersionAvailable.text = "Newest Version: \(info.uFailVersion ?? "Unknown")"
        }
    }
    // MARK: - Actions
    @IBAction func supportTapped(_ sender: Any) {
        if let url = URL(string: "https://uappsios.com/ufail-support") {
            let safari = SFSafariViewController(url: url)
            present(safari, animated: true, completion: nil)
        }
    }
    @IBAction func homeTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func downloaduSurf(_ sender: Any) {
        if let url = URL(string: "https://itunes.apple.com/us/app/usurf-universal/id953898887?ls=1&mt=8") {
            UIApplication.shared.openURL(url)
        }
        
    }
    @IBAction func downloaduTime(_ sender: Any) {
        if let url = URL(string: "https://apps.apple.com/us/app/utime-universal/id1125889944?ls=1") {
            UIApplication.shared.openURL(url)
        }
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
