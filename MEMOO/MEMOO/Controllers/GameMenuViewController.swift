import UIKit

class GameMenuViewController: UIViewController {

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
}
