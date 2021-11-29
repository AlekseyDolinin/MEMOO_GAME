import UIKit

class MenuView: UIView {
    
    @IBOutlet weak var unlockAllRounds: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
}

extension MenuView {
    ///
    func setUI() {
        guard let priceUnlockAllRounds = UserDefaults.standard.string(forKey: ProductIDs.unlockAllContentID.rawValue) else {
            unlockAllRounds.isHidden = true
            return
        }
        unlockAllRounds.setTitle("Unlock all rounds (\(priceUnlockAllRounds))", for: .normal)
    }
}
