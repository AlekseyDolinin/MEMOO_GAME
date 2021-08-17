import UIKit

class CardCell: UICollectionViewCell {

    @IBOutlet weak var backCard: UIImageView!
    @IBOutlet weak var imageCard: UIImageView!
    @IBOutlet weak var blure: UIVisualEffectView!
    
    var card: Card!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
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
            self.backCard.isHidden = false
            self.imageCard.isHidden = true
            self.blure.isHidden = true
        })
    }
    
    func show() {
        UIView.transition(with: self.contentView, duration: 0.3, options: .transitionFlipFromLeft, animations: {
            self.backCard.isHidden = true
            self.imageCard.isHidden = false
            self.blure.isHidden = false
            self.imageCard.image = self.card.image
        })
    }
}

extension CardCell {
    func setUI() {
        ///
        blure.layer.cornerRadius = 6
        blure.clipsToBounds = true
        backCard.image = UIImage(named: "buttonBack")
    }
}
