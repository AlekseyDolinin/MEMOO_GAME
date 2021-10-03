import UIKit

class LoseViewController: UIViewController {

    var viewSelf: LoseView! {
        guard isViewLoaded else {return nil}
        return (view as! LoseView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    ///
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: false) {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "back"), object: self)
        }
    }
}
