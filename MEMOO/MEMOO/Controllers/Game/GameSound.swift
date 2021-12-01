import Foundation
import AVFoundation

class Sound {
    
    static var playerBackgroundSound: AVAudioPlayer?
    static var playerSoundEffect: AVAudioPlayer?
    
    class func playSound(nameResource: String, typeFile: String) {
        guard let url = Bundle.main.url(forResource: nameResource, withExtension: typeFile) else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            playerSoundEffect = try AVAudioPlayer(contentsOf: url, fileTypeHint: typeFile)
            guard let player = playerSoundEffect else { return }
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    class func playBackgroundSound() {
        guard let url = Bundle.main.url(forResource: "WoodlandFantasy", withExtension: "mp3") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            playerBackgroundSound = try AVAudioPlayer(contentsOf: url, fileTypeHint: "mp3")
            guard let player = playerBackgroundSound else { return }
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    class func removePlayers() {
        playerBackgroundSound?.stop()
        playerSoundEffect?.stop()
        playerBackgroundSound = nil
        playerSoundEffect = nil
    }
}
