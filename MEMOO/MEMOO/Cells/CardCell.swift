import UIKit

class CardCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    var card: Card!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 4.0
        imageView.clipsToBounds = true
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
            self.imageView.backgroundColor = .clear
            self.imageView.image = UIImage(named: "buttonBack")
        })
    }
    
    func show() {
        UIView.transition(with: self.contentView, duration: 0.3, options: .transitionFlipFromLeft, animations: {
            self.imageView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1007918793)
            self.imageView.image = self.card.image
        })
    }
}
