import UIKit

class ModalLockedRoundView: UIView {
    
    @IBOutlet weak var previewCardCollection: UICollectionView!
    @IBOutlet weak var buttonStack: UIStackView!
    @IBOutlet weak var seeADButton: UIButton!
    @IBOutlet weak var unlockRoundButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func lockContent() {
        loader.startAnimating()
        UIView.animate(withDuration: 0.3) {
            self.previewCardCollection.alpha = 0.4
            self.buttonStack.alpha = 0.4
        }
        unlockRoundButton.isEnabled = false
        backButton.isEnabled = false
    }
    
    func unlockContent() {
        loader.stopAnimating()
        UIView.animate(withDuration: 0.3) {
            self.previewCardCollection.alpha = 1.0
            self.buttonStack.alpha = 1.0
        }
        unlockRoundButton.isEnabled = true
        backButton.isEnabled = true
    }
    
    func setupUI() {
        loader.stopAnimating()
        
    }
}
