import UIKit

class MenuViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: false)
    }
    
    @IBAction func home(_ sender: UIButton) {
        dismiss(animated: false) {
            self.navigationController?.popViewController(animated: true)
        }
    }

}
