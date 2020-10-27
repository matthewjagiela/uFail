//
//  HomeViewController.swift
//  uFail
//
//  Created by Matthew Jagiela on 1/5/20.
//  Copyright © 2020 Matthew Jagiela. All rights reserved.
//

import UIKit
import SideMenuSwift
import SpriteKit

class HomeViewController: UIViewController {
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var failButton: UIButton!
    @IBOutlet weak var messagesButton: UIButton!
    @IBOutlet weak var themeButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var snowView: SKView!
    let sound = SoundHandler()
    let theme = ThemeHandler()
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenuController?.delegate = self
        // Do any additional setup after loading the view.
        failButton.imageView?.contentMode = .scaleAspectFit
        NotificationCenter.default.addObserver(self, selector: #selector(refreshView), name: NSNotification.Name(rawValue: "refreshView"), object: nil)
        refreshView()
        
        if theme.dynamicTheme.shouldShowSnow() { //Snow should fall
            theme.dynamicTheme.setupSnowScene(view: snowView, size: view.bounds.size)
        } else {
            snowView.removeFromSuperview()
        }
    }
    @IBAction func playSound(_ sender: Any) {
        sound.playSound()
    }
    @IBAction func showMessageOptions(_ sender: Any) {
        let controller = sideMenuController?.menuViewController as? SelectorViewController
        controller?.type = .messages
        controller?.sound = sound
        sideMenuController?.revealMenu()
    }
    @IBAction func showThemeOptions(_ sender: Any) {
        let controller = sideMenuController?.menuViewController as? SelectorViewController
        controller?.type = .themes
        controller?.theme = theme
        sideMenuController?.revealMenu()
    }
    @objc func refreshView() {
        DispatchQueue.main.async {
            
            self.backgroundImage.image = self.theme.getBackgroundImage()
            self.failButton.setImage(self.theme.getFailButton(), for: .normal)
            if self.theme.theme == .dynamic {
                self.messagesButton.setTitleColor(self.theme.dynamicTheme.textColor(), for: .normal)
                self.themeButton.setTitleColor(self.theme.dynamicTheme.textColor(), for: .normal)
                self.infoButton.tintColor = self.theme.dynamicTheme.textColor()
            } else {
                self.messagesButton.setTitleColor(self.theme.textColor(), for: .normal)
                self.themeButton.setTitleColor(self.theme.textColor(), for: .normal)
                self.infoButton.tintColor = self.theme.textColor()
                
            }
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

extension HomeViewController: SideMenuControllerDelegate {
    func sideMenuControllerWillRevealMenu(_ sideMenuController: SideMenuController) {
        let controller = sideMenuController.menuViewController as? SelectorViewController
        if controller?.type == nil { controller?.type = .messages }
    }
}
