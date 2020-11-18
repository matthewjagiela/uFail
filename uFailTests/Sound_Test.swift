//
//  Sound_Test.swift
//  uFailTests
//
//  Created by Matthew Jagiela on 1/1/20.
//  Copyright © 2020 Matthew Jagiela. All rights reserved.
//

import UIKit
import XCTest
class Sound_Test: XCTestCase {
    
    func test_number_of_sounds() {
        let sound = SoundHandler()
        XCTAssertEqual(sound.listOfSounds().count, 9)
    }

}
