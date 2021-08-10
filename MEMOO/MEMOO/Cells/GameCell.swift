import UIKit

class GameCell: UICollectionViewCell {

    @IBOutlet weak var imageContent: UIImageView!
    @IBOutlet weak var back: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setCell(content: String) {
        
        switch content {
        case "fruit":
            imageContent.image = UIImage(named: "fruit_im")
        case "animal_":
            imageContent.image = UIImage(named: "animal_im")
        case "emoji_":
            imageContent.image = UIImage(named: "emoji_im")
        case "dinoCad_":
            imageContent.image = UIImage(named: "dino_im")
        case "monster_":
            imageContent.image = UIImage(named: "monster_im")

        default:
            break
        }
        
    }

}
