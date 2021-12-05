import Foundation
import AVFoundation

class Sound {
    
    static var playerBackgroundMusic: AVAudioPlayer?
    static var playerSoundOpenCard: AVAudioPlayer?
    static var playerSoundMath: AVAudioPlayer?
    static var playerSoundWin: AVAudioPlayer?
    
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
        
    ///
    class func playBGSound() {
        Sound.playerBackgroundMusic?.play()
    }
    
    ///
    class func playSoundOpenCard() {
        if !Sound.isSoundOn() { return }
        guard let url = Bundle.main.url(forResource: "click_sound_5", withExtension: "mp3") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            playerSoundOpenCard = try AVAudioPlayer(contentsOf: url, fileTypeHint: "mp3")
            guard let player = playerSoundOpenCard else { return }
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    ///
    class func playSoundMath() {
        if !Sound.isSoundOn() { return }
        guard let url = Bundle.main.url(forResource: "shimmer_1", withExtension: "flac") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            playerSoundMath = try AVAudioPlayer(contentsOf: url, fileTypeHint: "flac")
            guard let player = playerSoundMath else { return }
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    ///
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
    
    ///
    class func playSoundWin() {
        if !Sound.isSoundOn() { return }
        guard let url = Bundle.main.url(forResource: "sfx-victory1", withExtension: "mp3") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            playerBackgroundMusic = try AVAudioPlayer(contentsOf: url, fileTypeHint: "wav")
            guard let player = playerBackgroundMusic else { return }
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    ///
    class func removePlayers() {
        playerBackgroundMusic?.stop()
        playerBackgroundMusic = nil
        playerSoundOpenCard?.stop()
        playerSoundOpenCard = nil
        playerSoundMath?.stop()
        playerSoundMath = nil
        playerSoundWin?.stop()
        playerSoundWin = nil
    }
}
