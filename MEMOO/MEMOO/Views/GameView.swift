import UIKit

class GameView: UIView {
    
    @IBOutlet weak var cardCollection: UICollectionView!
    @IBOutlet weak var menuButton: UIButton!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        menuButton.isUserInteractionEnabled = false
    }
    
    func showTopBar() {
        self.menuButton.isUserInteractionEnabled = true
    }
}
