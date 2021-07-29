import UIKit

class StartViewController: UIViewController {

    var startView: StartView! {
        guard isViewLoaded else {return nil}
        return (view as! StartView)
    }
    
    var listGame = [Game]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startView.contentGameCollection.delegate = self
        startView.contentGameCollection.dataSource = self
        
        startView.contentGameCollection.collectionViewLayout = SnapPagingLayout(
            centerPosition: true,
            peekWidth: 80,
            spacing: 40,
            inset: 80
        )
    }
}

