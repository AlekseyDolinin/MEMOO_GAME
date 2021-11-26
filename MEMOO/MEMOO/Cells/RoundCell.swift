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
        setBlocked()
    }
    
    ///
    func setImage() {
        imageRound.image = UIImage(named: round.name)
    }
    
    ///
    func setBlocked() {
        if round.status == .free {
        
        } else {
        
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
