import UIKit

class MenuView: UIView {
    
    @IBOutlet weak var stackbutton: UIStackView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var unlockButton: UIButton!
    @IBOutlet weak var restoreButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    func lockContent() {
        loader.startAnimating()
        unlockButton.isEnabled = false
        restoreButton.isEnabled = false
    }
    
    func unlockContent() {
        loader.stopAnimating()
        unlockButton.isEnabled = true
        restoreButton.isEnabled = true
    }
    
}

extension MenuView {
    ///
    func setUI() {
        loader.stopAnimating()
        let productID = UserDefaults.standard.string(forKey: ProductIDs.unlockAllContentID.rawValue)
        guard let priceUnlockAllRounds = productID else {return}
        unlockButton.titleLabel?.textAlignment = .center
        unlockButton.setTitle("Unlock all rounds\nand remove AD (\(priceUnlockAllRounds))", for: .normal)
    }
}
