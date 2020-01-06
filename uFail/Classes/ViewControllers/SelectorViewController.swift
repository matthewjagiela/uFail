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
        print("DEBUG: SELECTOR: View Appeared")
        if sound != nil {
            print("DEBUG: SELECTOR: Sound Succesfull Passed")
        } else { print("DEBUG: SELECTOR: ERROR: Sound Did Not Pass") }
    }

}
