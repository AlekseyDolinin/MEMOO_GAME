import UIKit

class WinViewController: UIViewController {

    var viewSelf: WinView! {
        guard isViewLoaded else {return nil}
        return (view as! WinView)
    }
    
    var totalscore: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let score = totalscore {
            viewSelf.scoreLabel.text = "\(score)"
        }
    }
    
    ///
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: false) {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "back"), object: self)
        }
    }
}
