import UIKit

class GameView: UIView {
    
    @IBOutlet weak var cardCollection: UICollectionView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var viewForTimer: UIView!
    @IBOutlet weak var topBar: UIView!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var menuButton: UIButton!
    
    var gameContent = (name: String(), blocked: Bool(), record: Int())
    
    override func awakeFromNib() {
        super.awakeFromNib()
        topBar.transform = CGAffineTransform(translationX: 0, y: -140)
        menuButton.isUserInteractionEnabled = false
    }

    override func draw(_ rect: CGRect) {
        timerLabel.font = UIFont(name: "Shadow-Regular", size: viewForTimer.frame.width * 0.4)
    }
    
    func showTopBar() {
        UIView.animate(withDuration: 0.5, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
            self.topBar.transform = .identity
        }) { (true) in
            self.menuButton.isUserInteractionEnabled = true
        }
    }
    
    func setRecordLabel() {
        recordLabel.isHidden = gameContent.record == 0 ? true : false
        recordLabel.text = "record: \(gameContent.record)"
    }
}
