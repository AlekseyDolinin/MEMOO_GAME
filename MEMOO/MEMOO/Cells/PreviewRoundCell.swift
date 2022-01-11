import UIKit

class PreviewRoundCell: UICollectionViewCell {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var imageCard: UIImageView!
    
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
//        imageCard.image = UIImage(named: round.name + "1")
    }
}

extension PreviewRoundCell {
    func setUI() {
        backView.layer.cornerRadius = 6
    }
}
