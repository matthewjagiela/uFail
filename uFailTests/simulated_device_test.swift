//
//  simulated_device_test.swift
//  uFailTests
//
//  Created by Matthew Jagiela on 12/28/19.
//  Copyright © 2019 Matthew Jagiela. All rights reserved.
//

import UIKit
import XCTest
class simulated_device_test: XCTestCase {
    func test_device() {
        let testDevice = DeviceHandler.Device.iPhoneX
        let deviceHandler = DeviceHandler()
        let currentDevice = deviceHandler.currentDevice()
        XCTAssertEqual(testDevice, currentDevice)
    }

}
