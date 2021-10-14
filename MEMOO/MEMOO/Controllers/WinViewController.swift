import UIKit

class WinViewController: UIViewController {

    var viewSelf: WinView! {
        guard isViewLoaded else {return nil}
        return (view as! WinView)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let record = UserDefaults.standard.integer(forKey: StartViewController.nameGame + "record")
        viewSelf.scoreLabel.text = "\(record)"
    }
    
    ///
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: false) {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "back"), object: self)
        }
    }
}
