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
        viewSelf.previewCardCollection.delegate = self
        viewSelf.previewCardCollection.dataSource = self
    }

    ///
    @IBAction func buyRound(_ sender: UIButton) {
        storeManager.buyInApp(inAppID: round.idRound ?? "")
        viewSelf.lockContent()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
//            self.viewSelf.unlockContent()
//        }
    }
    
    ///
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
