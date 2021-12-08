import UIKit

class ModalLockedRoundViewController: UIViewController {

    var viewSelf: ModalLockedRoundView! {
        guard isViewLoaded else {return nil}
        return (view as! ModalLockedRoundView)
    }
    
    var countCell = 20
    var storeManager = StoreManager()
    var round: Round!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSelf.round = self.round
        viewSelf.previewCardCollection.delegate = self
        viewSelf.previewCardCollection.dataSource = self
        
        ///
        NotificationCenter.default.addObserver(forName: nTransactionFailed, object: nil, queue: nil) { notification in
            self.viewSelf.unlockContent()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewSelf.setupUI()
    }
    
    ///
    @IBAction func buyRound(_ sender: UIButton) {
        storeManager.buyInApp(inAppID: round.idRound)
        viewSelf.lockContent()
    }
    
    ///
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
