import UIKit

class GameCell: UICollectionViewCell {

    @IBOutlet weak var imageContent: UIImageView!
    @IBOutlet weak var back: UIView!
    @IBOutlet weak var viewBlockedContent: UIView!
    @IBOutlet weak var stateRecord: UIStackView!
    @IBOutlet weak var valueRecordLabel: UILabel!
    
    var nameGame: String!
    
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
        imageContent.image = UIImage(named: nameGame)
    }
    
    ///
    func setBlocked() {
        viewBlockedContent.isHidden = true
//        viewBlockedContent.isHidden = !gameContent.blocked
    }
    
    ///
    func setrecord() {
        let valueRecord = UserDefaults.standard.integer(forKey: nameGame + "record")
        stateRecord.isHidden = valueRecord == 0 ? true : false
        valueRecordLabel.text = "\(valueRecord)"
    }
}
