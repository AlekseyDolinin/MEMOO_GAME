import UIKit

class GameView: UIView {
    
    @IBOutlet weak var backImageBlur: UIImageView!
    @IBOutlet weak var cardCollection: UICollectionView!
    @IBOutlet weak var timerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backImageBlur.alpha = 0
    }
    
    func showBackBlure() {
        UIView.animate(withDuration: 0.5) {
            self.backImageBlur.alpha = 1
        }
    }

}
