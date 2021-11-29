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
        print(round.name)
        print(round.idRound)
        storeManager.buyInApp(inAppID: round.idRound ?? "")
    }
    
    ///
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
