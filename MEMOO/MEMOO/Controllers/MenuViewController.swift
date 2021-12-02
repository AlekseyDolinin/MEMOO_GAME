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
        ///
        NotificationCenter.default.addObserver(forName: nTransactionFailed, object: nil, queue: nil) { notification in
            self.viewSelf.unlockContent()
        }
    }
    
    
    @IBAction func unlockAllRoundsAction(_ sender: UIButton) {
        storeManager.buyInApp(inAppID: ProductIDs.unlockAllContentID.rawValue)
        viewSelf.lockContent()
    }
    
    @IBAction func restore(_ sender: UIButton) {
        storeManager.restorePurchase()
        viewSelf.lockContent()
    }
    
    ///
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: false)
    }
}
