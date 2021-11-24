import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    ///
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: false)
    }
    
    ///
    @IBAction func restart(_ sender: UIButton) {
        dismiss(animated: false) {
            NotificationCenter.default.post(name: nRestart, object: nil)
        }
    }
    
    ///
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: false) {
            NotificationCenter.default.post(name: nBack, object: nil)
        }
    }
}
