//
//  InfoViewController.swift
//  uFail
//
//  Created by Matthew Jagiela on 1/16/20.
//  Copyright © 2020 Matthew Jagiela. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var supportButton: UIBarButtonItem!
    @IBOutlet weak var homeButton: UIBarButtonItem!
    @IBOutlet weak var uAppsNewsLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        uAppsNewsLabel.adjustsFontSizeToFitWidth = true
        // Do any additional setup after loading the view.
    }
    @IBAction func supportTapped(_ sender: Any) {
    }
    @IBAction func homeTapped(_ sender: Any) {
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
