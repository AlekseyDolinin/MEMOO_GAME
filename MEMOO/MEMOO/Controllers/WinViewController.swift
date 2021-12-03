import UIKit

class WinViewController: UIViewController {

    var viewSelf: WinView! {
        guard isViewLoaded else {return nil}
        return (view as! WinView)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    ///
    @IBAction func reloadRound(_ sender: UIButton) {
        dismiss(animated: false) {
            NotificationCenter.default.post(name: nReloadRound, object: self)
        }
    }
    
    ///
    @IBAction func backHome(_ sender: UIButton) {
        dismiss(animated: false) {
            NotificationCenter.default.post(name: nBackHome, object: self)
        }
    }
}
