import UIKit

class CardCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    var card: Card!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setCell() {
        if card.showCard == true {
            show()
        } else {
            hide()
        }
    }
    
    func hide() {
        UIView.transition(with: self.contentView, duration: 0.3, options: .transitionFlipFromLeft, animations: {
            self.imageView.image = UIImage(named: "stone")
        })
    }
    
    func show() {
        UIView.transition(with: self.contentView, duration: 0.3, options: .transitionFlipFromLeft, animations: {
            self.imageView.image = self.card.image
        })
    }
}
