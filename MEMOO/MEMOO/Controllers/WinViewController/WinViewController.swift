import UIKit
import GoogleMobileAds
class WinViewController: UIViewController, GADFullScreenContentDelegate {

    var viewSelf: WinView! {
        guard isViewLoaded else {return nil}
        return (view as! WinView)
    }
    var rewardedAd: GADRewardedAd?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.gadRequest()
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
    @IBAction func restartRound(_ sender: UIButton) {
        checkStatusRound()
    }
    
    ///
    @IBAction func backHome(_ sender: UIButton) {
        dismiss(animated: false) {
            NotificationCenter.default.post(name: nBackHome, object: self)
        }
    }
}
