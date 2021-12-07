import UIKit

class RoundCell: UICollectionViewCell {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var imageRound: UIImageView!
    
    var round: Round!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    func setCell() {
        setImage()
    }
    
    ///
    func setImage() {
        if round.roundFree || round.roundBuy || StoreManager.isUnlockAllContent() {
            imageRound.image = UIImage(named: round.name)
        } else {
            imageRound.image = UIImage(named: round.name)?.noir
        }
    }
}

extension RoundCell {
    func setUI() {
        /// color
        
        ///
        ///
    }
}
