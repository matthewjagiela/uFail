//
//  SelectorViewController.swift
//  uFail
//
//  Created by Matthew Jagiela on 1/5/20.
//  Copyright © 2020 Matthew Jagiela. All rights reserved.
//

import UIKit
import SideMenuSwift
class SelectorViewController: UIViewController, SideMenuControllerDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    var sound: SoundHandler?
    public enum types {
        case messages
        case themes
    }
    var type: types?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    override func viewDidAppear(_ animated: Bool) {
        debuggingVariables()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //Set the navigation title:
        switch type {
        case .messages:
            navigationBar.topItem?.title = "Messages"
        default:
            navigationBar.topItem?.title = "Themes"
        }
    }
    func debuggingVariables() {
        if sound != nil {
            print("DEBUG: SELECTOR: Sound Succesfull Passed")
        } else { print("DEBUG: SELECTOR: ERROR: Sound Did Not Pass") }
        if type != nil {
            print("DEBUG: SELECTOR: TYPE IS \(String(describing: type))")
        } else { print("DEBUG: SELECTOR: TYPE IS NIL =(") }
    }

}
extension SelectorViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch type {
        case .messages:
            return sound?.numberOfSounds() ?? 0
        default:
            return 1
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MessagesTableViewCell()
        return cell
    }
}
