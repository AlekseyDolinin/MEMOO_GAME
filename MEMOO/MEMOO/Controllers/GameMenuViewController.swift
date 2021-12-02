import UIKit

class GameMenuViewController: UIViewController {
    
    @IBOutlet weak var soundButton: UIButton!
    @IBOutlet weak var widthButtonConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if Sound.isMusicOn() {
//            musicButton.setTitle("Music Off", for: .normal)
//        } else {
//            musicButton.setTitle("Music On", for: .normal)
//        }
        widthButtonConstraint.constant = view.frame.width / 4
    }
    
    ///
    @IBAction func backToGame(_ sender: UIButton) {
        dismiss(animated: false)
    }
    
    ///
    @IBAction func restartRound(_ sender: UIButton) {
        dismiss(animated: false) {
            NotificationCenter.default.post(name: nRestart, object: nil)
        }
    }
    
    ///
    @IBAction func finishRound(_ sender: UIButton) {
        dismiss(animated: false) {
            NotificationCenter.default.post(name: nBack, object: nil)
        }
    }
    
    ///
    @IBAction func soundAction(_ sender: UIButton) {
        Sound.changeSettings()
        let title = soundButton.titleLabel?.text == "Sound Off" ? "Sound On" : "Sound Off"
        soundButton.setTitle(title, for: .normal)
        if title == "Sound Off" {
            Sound.soundAction(action: true)
        } else {
            Sound.soundAction(action: false)
        }
    }
    
    ///
    @IBAction func musicAction(_ sender: UIButton) {
        Sound.changeSettings()
//        let title = musicButton.titleLabel?.text == "Music Off" ? "Music On" : "Music Off"
//        musicButton.setTitle(title, for: .normal)
        if title == "Music Off" {
            Sound.playBackgroundSound()
            Sound.musicAction(action: true)
        } else {
            Sound.playerBackgroundMusic?.pause()
            Sound.musicAction(action: false)
        }
    }
}
