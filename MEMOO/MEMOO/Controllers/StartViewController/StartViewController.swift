import UIKit

class StartViewController: UIViewController {

    var startView: StartView! {
        guard isViewLoaded else {return nil}
        return (view as! StartView)
    }
    
    var listGame = ["fruit_", "animal_", "emoji_", "dinosaur_", "monster_"]
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        startView.contentGameCollection.delegate = self
        startView.contentGameCollection.dataSource = self
        
        startView.contentGameCollection.collectionViewLayout = SnapPagingLayout(
            centerPosition: true,
            peekWidth: 40,
            spacing: 20,
            inset: 40
        )
    }
    
    @IBAction func startGame(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        vc.nameCard = listGame[currentIndex]
        navigationController?.pushViewController(vc, animated: true)
    }
}
