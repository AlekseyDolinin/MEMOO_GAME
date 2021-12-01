import Foundation
import AVFoundation

class Sound {
    
    static var playerBackgroundMusic: AVAudioPlayer?
    static var playerSoundEffect: AVAudioPlayer?
    
    class func changeSettings() {
        UserDefaults.standard.set(true, forKey: "ChangeSettings")
    }
    
    class func isUserChangeSettings() -> Bool {
        return UserDefaults.standard.bool(forKey: "ChangeSettings")
    }
    
    class func allSoundOn() {
        UserDefaults.standard.set(true, forKey: "Sound")
        UserDefaults.standard.set(true, forKey: "Music")
    }
    
    class func isSoundOn() -> Bool {
        return UserDefaults.standard.bool(forKey: "Sound")
    }
    
    class func isMusicOn() -> Bool {
        return UserDefaults.standard.bool(forKey: "Music")
    }
    
    class func musicAction(action: Bool) {
        if action == true {
            print("музыка включена")
        } else {
            print("музыка выключена")
        }
        UserDefaults.standard.set(action, forKey: "Music")
    }
    
    class func soundAction(action: Bool) {
        if action == true {
            print("звуки выключены")
        } else {
            print("звуки включены")
        }
        UserDefaults.standard.set(action, forKey: "Sound")
    }
    
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
