//
//  HomeViewController.swift
//  uFail
//
//  Created by Matthew Jagiela on 1/5/20.
//  Copyright © 2020 Matthew Jagiela. All rights reserved.
//

import UIKit
import SideMenuSwift

class HomeViewController: UIViewController {
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var failButton: UIButton!
    @IBOutlet weak var messagesButton: UIButton!
    @IBOutlet weak var themeButton: UIButton!
    let sound = SoundHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func playSound(_ sender: Any) {
        sound.playSound()
    }
    @IBAction func showMessageOptions(_ sender: Any) {
        let controller = sideMenuController?.menuViewController as? SelectorViewController
        controller?.sound = sound
        sideMenuController?.revealMenu()
    }
    @IBAction func showThemeOptions(_ sender: Any) {
        sideMenuController?.revealMenu()
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
