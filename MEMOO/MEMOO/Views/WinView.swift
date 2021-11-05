import UIKit

class WinView: UIView {
    
    @IBOutlet weak var closeButton: UIButton!
    
    var gameContent = (name: String(), blocked: Bool())
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
