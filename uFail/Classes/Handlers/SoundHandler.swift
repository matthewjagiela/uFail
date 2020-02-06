//
//  SoundHandler.swift
//  uFail
//
//  Created by Matthew Jagiela on 12/29/19.
//  Copyright © 2019 Matthew Jagiela. All rights reserved.
//

import UIKit
import AVFoundation

class SoundHandler: NSObject {
    var sound: Sound = .uFail
     var player: AVAudioPlayer?
    public enum Sound {
        case airhorn
        case epicFail
        case fail
        case failure
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
    func playSound() {
        var path: String = ""
        var audioURL: URL?
        var fileName: String = ""
        switch sound {
        case .airhorn:
            fileName = "AIRHORN.mp3"
        case .epicFail:
            fileName = "EPIC FAIL.mp3"
        case .fail:
            fileName = "FAIL.mp3"
        case .failure:
            fileName = "failure.mp3"
        case .noob:
            fileName = "Noob!.mp3"
        case .pwned:
            fileName = "PWNED.mp3"
        case .santa:
            fileName = "santa.mp3"
        case .soManyFriends:
            fileName = "So Many Friends.mp3"
        case .win:
            fileName = "WIN.mp3"
        default:
            fileName = "You Fail.mp3"
        }
        path = Bundle.main.path(forResource: "\(fileName)", ofType: nil) ?? ""
        audioURL = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: audioURL ?? URL(fileURLWithPath: path))
            player?.play()
        } catch {
            print("ERROR!!!! SOUND! = \(error.localizedDescription)")
        }
        
    }
    
    func numberOfSounds() -> Int {
        return listOfSounds().count
    }
    func listOfSounds() -> [String] {
        return ["uFail", "Air Horn", "Epic Fail", "Fail", "Failure", "Noob", "Pwned", "So Many Friends", "Win"]
    }
    
}
