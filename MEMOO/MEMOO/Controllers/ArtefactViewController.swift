import UIKit

class ArtefactViewController: UIViewController {

    var viewSelf: ArtefactView! {
        guard isViewLoaded else {return nil}
        return (view as! ArtefactView)
    }
    
    var selectRound: Round!
    var countCell = 40
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewSelf.artefactCollection.delegate = self
        viewSelf.artefactCollection.dataSource = self
    }

    ///
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true) {
            
        }
    }
}
