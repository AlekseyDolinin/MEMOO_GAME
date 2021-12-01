import UIKit

class GameMenuViewController: UIViewController {
    
    @IBOutlet weak var musicButton: UIButton!
    @IBOutlet weak var soundButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        let title = soundButton.titleLabel?.text == "Sound Off" ? "Sound On" : "Sound Off"
        soundButton.setTitle(title, for: .normal)
        if title == "Sound Off" {
            Sound.playerSoundEffect?.pause()
        } else {
            Sound.playerSoundEffect?.play()
        }
    }
    
    ///
    @IBAction func musicAction(_ sender: UIButton) {
        let title = musicButton.titleLabel?.text == "Music Off" ? "Music On" : "Music Off"
        musicButton.setTitle(title, for: .normal)
        if title == "Music Off" {
            Sound.playerBackgroundMusic?.play()
        } else {
            Sound.playerBackgroundMusic?.pause()
        }
    }
}
