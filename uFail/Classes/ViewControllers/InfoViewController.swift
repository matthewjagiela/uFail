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
import SpriteKit

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
    @IBOutlet weak var changesView: UITextView!
    @IBOutlet weak var snowView: SKView!
    // MARK: - Class Variables
    let info = AppHandler()
    let theme = ThemeHandler()
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage.image = theme.getBackgroundImage()
        uAppsNewsLabel.adjustsFontSizeToFitWidth = true
        currentlyRunningVersion.adjustsFontSizeToFitWidth = true
        newestVersionAvailable.adjustsFontSizeToFitWidth = true
        failCountLabel.text = "Fail Count: \(iCloudHandler.getFailCount())"
        uAppsNewsLabel.text = "Loading..."
        newestVersionAvailable.text = "Loading..."
        currentlyRunningVersion.text = info.getAppVersion()
        changesView.text = info.changes()
        bannerAd.adUnitID = "ca-app-pub-7714978111013265/9368677969"
        bannerAd.rootViewController = self
        bannerAd.load(GADRequest())
        
        failCountLabel.backgroundColor = theme.dynamicTheme.labelBGColor()
        currentlyRunningVersion.backgroundColor = theme.dynamicTheme.labelBGColor()
        newestVersionAvailable.backgroundColor = theme.dynamicTheme.labelBGColor()
        uAppsNewsLabel.backgroundColor = theme.dynamicTheme.labelBGColor()
        copyrightLabel.backgroundColor = theme.dynamicTheme.labelBGColor()
        
        failCountLabel.textColor = theme.dynamicTheme.textColor()
        currentlyRunningVersion.textColor = theme.dynamicTheme.textColor()
        newestVersionAvailable.textColor = theme.dynamicTheme.textColor()
        uAppsNewsLabel.textColor = theme.dynamicTheme.textColor()
        copyrightLabel.textColor = theme.dynamicTheme.textColor()
        
        if theme.dynamicTheme.shouldShowSnow() { //Snow should fall
            theme.dynamicTheme.setupSnowScene(view: snowView, size: view.bounds.size)
        } else {
            snowView.removeFromSuperview()
        }
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if #available(iOS 13, *) {
            
        } else { UIApplication.shared.statusBarView?.backgroundColor = .white }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        info.labelsFilled { (info) in
            self.uAppsNewsLabel.text = "uApps News: \(info.uAppsNews ?? "Thank You For Using uFail")"
            self.newestVersionAvailable.text = "Newest Version: \(info.uFailVersion ?? "Unknown")"
        }
        UIView.animate(withDuration: 0.1) {
            self.changesView.contentOffset = .zero
        }
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        if #available(iOS 13, *) {
            
        } else { UIApplication.shared.statusBarView?.backgroundColor = .clear }
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

extension UIApplication {
    var statusBarView: UIView? {
        if responds(to: Selector(("statusBar"))) {
            return value(forKey: "statusBar") as? UIView
        }
        return nil
    }
}
