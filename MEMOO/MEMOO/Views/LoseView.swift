import UIKit

class LoseView: UIView {
    
    @IBOutlet weak var closeButton: UIButton!
    
    var gameContent = (name: String(), blocked: Bool(), record: Int())
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
}
