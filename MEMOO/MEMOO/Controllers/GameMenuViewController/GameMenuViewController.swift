import UIKit
import GoogleMobileAds

class GameMenuViewController: UIViewController, GADFullScreenContentDelegate {
    
    @IBOutlet weak var soundButton: UIButton!
    @IBOutlet weak var widthButtonConstraint: NSLayoutConstraint!
    
    var rewardedAd: GADRewardedAd?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.gadRequest()
        
        print("Sound.isSoundOn(): \(Sound.isSoundOn())")
        let nameIconSound = Sound.isSoundOn() ? "btnSoundOff" : "btnSoundOn"
        soundButton.setImage(UIImage(named: nameIconSound), for: .normal)
        widthButtonConstraint.constant = view.frame.width / 4
    }
    
    ///
    func checkStatusRound() {
        StartViewController.selectRound.roundFree ? checkHaveBuyContent() : reloadRound()
    }
    
    /// проверка есть ли купленый контент
    func checkHaveBuyContent() {
        StartViewController.haveBuyContent == true ? reloadRound() : showADS()
    }
    
    ///
    func reloadRound() {
        dismiss(animated: false, completion: {
            self.dismiss(animated: true) {
                NotificationCenter.default.post(name: nReloadRound, object: nil)
            }
        })
    }
    
    ///
    @IBAction func backToGame(_ sender: UIButton) {
        dismiss(animated: false)
    }
    
    ///
    @IBAction func restartRound(_ sender: UIButton) {
        TimerRound.stopTimer()
        checkStatusRound()
    }
    
    ///
    @IBAction func finishRound(_ sender: UIButton) {
        TimerRound.stopTimer()
        dismiss(animated: false) {
            NotificationCenter.default.post(name: nBackHome, object: nil)
        }
    }
    
    ///
    @IBAction func soundAction(_ sender: UIButton) {
        let nameIconSound = Sound.isSoundOn() ? "btnSoundOn" : "btnSoundOff"
        soundButton.setImage(UIImage(named: nameIconSound), for: .normal)
        Sound.changeStateSound(action: !Sound.isSoundOn())
    }
}
