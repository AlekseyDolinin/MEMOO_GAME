import UIKit

class ModalLockedRoundViewController: UIViewController {

    var viewSelf: ModalLockedRoundView! {
        guard isViewLoaded else {return nil}
        return (view as! ModalLockedRoundView)
    }
    
    var selectRound: Round!
    var countCell = 20
    var storeManager = StoreManager()
    var roundID: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewSelf.previewCardCollection.delegate = self
        viewSelf.previewCardCollection.dataSource = self
    }

    ///
    @IBAction func buyRound(_ sender: UIButton) {
        storeManager.buyInApp(inAppID: roundID ?? "")
    }
    
    ///
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
