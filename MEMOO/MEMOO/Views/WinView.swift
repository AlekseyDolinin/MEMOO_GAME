import UIKit

class WinView: UIView {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    
    var gameContent = (name: String(), blocked: Bool(), record: Int())
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setRecordLabel()
    }
    
    func setRecordLabel() {
        scoreLabel.text = "\(gameContent.record)"
    }
}
