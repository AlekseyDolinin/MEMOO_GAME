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
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "restart"), object: self)
        }
    }
    
    ///
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: false) {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "back"), object: self)
        }
    }
}
