import UIKit

class GameCell: UICollectionViewCell {

    @IBOutlet weak var imageContent: UIImageView!
    @IBOutlet weak var back: UIView!
    @IBOutlet weak var imageBlockedContent: UIImageView!
    
    var gameContent = (name: String(), blocked: Bool())
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setCell() {
        
        switch gameContent.name {
        case "fruit_":
            imageContent.image = UIImage(named: "fruit_im")
        case "animal_":
            imageContent.image = UIImage(named: "animal_im")
        case "emoji_":
            imageContent.image = UIImage(named: "emoji_im")
        case "dinosaur_":
            imageContent.image = UIImage(named: "dino_im")
        case "monster_":
            imageContent.image = UIImage(named: "monster_im")
        default:
            break
        }
        
        imageBlockedContent.isHidden = !gameContent.blocked
    }
}
