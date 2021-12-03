import Foundation
import AVFoundation

class Sound {
    
    static var playerBackgroundMusic: AVAudioPlayer?
    static var playerSoundEffect: AVAudioPlayer?
    
    class func isSoundOn() -> Bool {
        return UserDefaults.standard.bool(forKey: "Sound")
    }
    
    ///
    class func changeStateSound(action: Bool) {
        action == true ? print("звуки включены") : print("звуки выключены")
        UserDefaults.standard.set(action, forKey: "Sound")
        ///
        soundAction(action: action)
    }
    
    ///
    class func soundAction(action: Bool) {
        if action == false {
            playerBackgroundMusic?.pause()
            return
        }
        playerBackgroundMusic?.isPlaying == false ? playBGSound() : playBackgroundSound()
    }
    
    
    
    class func playBGSound() {
        Sound.playerBackgroundMusic?.play()
    }
    
    
    class func playSound(nameResource: String, typeFile: String) {
        if !Sound.isSoundOn() { return }
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
        if !Sound.isSoundOn() { return }
        guard let url = Bundle.main.url(forResource: "WoodlandFantasy", withExtension: "mp3") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            playerBackgroundMusic = try AVAudioPlayer(contentsOf: url, fileTypeHint: "mp3")
            guard let player = playerBackgroundMusic else { return }
            player.play()
            player.numberOfLoops = -1
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
