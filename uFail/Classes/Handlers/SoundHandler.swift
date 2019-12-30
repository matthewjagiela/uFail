//
//  SoundHandler.swift
//  uFail
//
//  Created by Matthew Jagiela on 12/29/19.
//  Copyright © 2019 Matthew Jagiela. All rights reserved.
//

import UIKit

class SoundHandler: NSObject {
    var sound: Sound = .uFail
    let data = DataHandler()
    public enum Sound {
        case airhorn
        case epicFail
        case fail
        case noob
        case pwned
        case santa
        case soManyFriends
        case win
        case uFail
    }
    func selectSound(_ sound: Sound) {
        self.sound = sound
    }
    
}
