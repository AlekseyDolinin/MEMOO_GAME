import UIKit
import CryptoKit

class MenuViewController: UIViewController {
    
    var viewSelf: MenuView! {
        guard isViewLoaded else {return nil}
        return (view as! MenuView)
    }
    
    var storeManager = StoreManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func unlockAllRoundsAction(_ sender: UIButton) {
        storeManager.buyInApp(inAppID: ProductIDs.unlockAllContentID.rawValue)
    }
    
    ///
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: false)
    }
}
