import Foundation
import AVFoundation

class Sound {
    
    static var playerBackgroundMusic: AVAudioPlayer?
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
            playerBackgroundMusic = try AVAudioPlayer(contentsOf: url, fileTypeHint: "mp3")
            guard let player = playerBackgroundMusic else { return }
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    class func removePlayers() {
        playerBackgroundMusic?.stop()
        playerSoundEffect?.stop()
        playerBackgroundMusic = nil
        playerSoundEffect = nil
    }
}
