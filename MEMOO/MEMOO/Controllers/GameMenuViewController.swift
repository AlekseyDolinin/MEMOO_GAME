import UIKit

class GameMenuViewController: UIViewController {
    
    @IBOutlet weak var soundButton: UIButton!
    @IBOutlet weak var widthButtonConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nameIconSound = Sound.isSoundOn() ? "btnSoundOff" : "btnSoundOn"
        soundButton.setImage(UIImage(named: nameIconSound), for: .normal)
        widthButtonConstraint.constant = view.frame.width / 4
    }
    
    ///
    @IBAction func backToGame(_ sender: UIButton) {
        dismiss(animated: false)
    }
    
    ///
    @IBAction func restartRound(_ sender: UIButton) {
        dismiss(animated: false) {
            NotificationCenter.default.post(name: nReloadRound, object: nil)
        }
    }
    
    ///
    @IBAction func finishRound(_ sender: UIButton) {
        dismiss(animated: false) {
            NotificationCenter.default.post(name: nBackHome, object: nil)
        }
    }
    
    ///
    @IBAction func soundAction(_ sender: UIButton) {
        let nameIconSound = Sound.isSoundOn() ? "btnSoundOn" : "btnSoundOff"
        soundButton.setImage(UIImage(named: nameIconSound), for: .normal)
        Sound.soundAction(action: !Sound.isSoundOn())
    }
}
