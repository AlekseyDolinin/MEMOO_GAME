import UIKit

class GameView: UIView {
    
    @IBOutlet weak var cardCollection: UICollectionView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var viewForTimer: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        

    }

    override func draw(_ rect: CGRect) {
        timerLabel.font = UIFont(name: "Shadow-Regular", size: viewForTimer.frame.width * 0.4)
    }
}
