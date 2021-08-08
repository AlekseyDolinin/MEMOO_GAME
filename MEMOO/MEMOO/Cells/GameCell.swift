import UIKit

class GameCell: UICollectionViewCell {

    @IBOutlet weak var nameContent: UILabel!
    @IBOutlet weak var imageContent: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func setCell() {
        
        switch nameContent.text {
        case "fruits":
            imageContent.image = UIImage(named: "fruit6")
        case "dinosaurs":
            imageContent.image = UIImage(named: "dinoCad_6")
        case "monsters":
            imageContent.image = UIImage(named: "monster_12")
        default:
            break
        }
        
    }

}
