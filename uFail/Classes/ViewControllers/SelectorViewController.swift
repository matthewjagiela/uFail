//
//  SelectorViewController.swift
//  uFail
//
//  Created by Matthew Jagiela on 1/5/20.
//  Copyright © 2020 Matthew Jagiela. All rights reserved.
//

import UIKit
import SideMenuSwift
class SelectorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SideMenuControllerDelegate {
    var sound: SoundHandler?
    public enum types {
        case messages
        case themes
    }
    var type: types?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    override func viewDidAppear(_ animated: Bool) {
        debuggingVariables()
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
