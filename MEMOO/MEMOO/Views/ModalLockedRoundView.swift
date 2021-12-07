import UIKit

class ModalLockedRoundView: UIView {
    
    @IBOutlet weak var previewCardCollection: UICollectionView!
    @IBOutlet weak var buttonStack: UIStackView!
    @IBOutlet weak var seeADButton: UIButton!
    @IBOutlet weak var unlockRoundButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    var round: Round!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func lockContent() {
        loader.startAnimating()
        UIView.animate(withDuration: 0.3) {
            self.previewCardCollection.alpha = 0.4
            self.unlockRoundButton.alpha = 0.4
            self.backButton.alpha = 0.4
        }
        unlockRoundButton.isEnabled = false
        backButton.isEnabled = false
    }
    
    func unlockContent() {
        loader.stopAnimating()
        UIView.animate(withDuration: 0.3) {
            self.previewCardCollection.alpha = 1.0
            self.unlockRoundButton.alpha = 1.0
            self.backButton.alpha = 1.0
        }
        unlockRoundButton.isEnabled = true
        backButton.isEnabled = true
    }
    
    func setupUI() {
        loader.stopAnimating()
        guard let priceUnlockRound = UserDefaults.standard.string(forKey: String(round.idRound)) else {
            return
        }
        unlockRoundButton.setTitle("Unlock the round (\(priceUnlockRound))", for: .normal)
    }
}
