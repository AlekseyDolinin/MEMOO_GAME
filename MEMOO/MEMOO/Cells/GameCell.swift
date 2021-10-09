import UIKit

class GameCell: UICollectionViewCell {

    @IBOutlet weak var imageContent: UIImageView!
    @IBOutlet weak var back: UIView!
    @IBOutlet weak var viewBlockedContent: UIView!
    @IBOutlet weak var stateRecord: UIStackView!
    @IBOutlet weak var valueRecordLabel: UILabel!
    
    var gameContent = (name: String(), blocked: Bool(), record: Int())
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setCell() {
        setImage()
        setBlocked()
        setrecord()
    }
    
    ///
    func setImage() {
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
    }
    
    ///
    func setBlocked() {
        viewBlockedContent.isHidden = !gameContent.blocked
    }
    
    ///
    func setrecord() {
        stateRecord.isHidden = gameContent.record == 0 ? true : false
        valueRecordLabel.text = "\(gameContent.record)"
    }
}
