//
//  ThemeHandler.swift
//  uFail
//
//  Created by Matthew Jagiela on 12/28/19.
//  Copyright © 2019 Matthew Jagiela. All rights reserved.
//

import UIKit

class ThemeHandler: NSObject {
    let data = DataHandler()
    var theme = ""
    override init() {
        super.init()
        theme = data.getTheme()
    }
    
}
