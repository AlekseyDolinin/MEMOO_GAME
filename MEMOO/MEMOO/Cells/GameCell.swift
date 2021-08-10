import UIKit

class GameCell: UICollectionViewCell {

    @IBOutlet weak var imageContent: UIImageView!
    @IBOutlet weak var imageNameContent: UIImageView!
    @IBOutlet weak var back: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        back.layer.cornerRadius = 16
    }

    func setCell(content: String) {
        
        switch content {
        case "fruit":
            imageContent.image = UIImage(named: "fruit_im")
            imageNameContent.image = UIImage(named: "fruit_l")
        case "animal_":
            imageContent.image = UIImage(named: "animal_im")
            imageNameContent.image = UIImage(named: "animals_l")
        case "emoji_":
            imageContent.image = UIImage(named: "emoji_im")
            imageNameContent.image = UIImage(named: "emoji_l")
        case "dinoCad_":
            imageContent.image = UIImage(named: "dino_im")
            imageNameContent.image = UIImage(named: "dino_l")
        case "monster_":
            imageContent.image = UIImage(named: "monster_im")
            imageNameContent.image = UIImage(named: "monster_l")

        default:
            break
        }
        
    }

}
