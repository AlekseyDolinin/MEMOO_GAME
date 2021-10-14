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
        /// free content
        if (["fruit_", "emoji_"]).contains(nameGame) {
            viewBlockedContent.isHidden = true
            return
        }
        
        if StartViewController.unlockAllGame == true {
            viewBlockedContent.isHidden = true
            return
        }
        
        let dateSeeADVString = UserDefaults.standard.object(forKey: nameGame + "date")
        /// nil - игра заблокирована
        viewBlockedContent.isHidden = dateSeeADVString == nil ? false : true
    }
    
    ///
    func setrecord() {
        let valueRecord = UserDefaults.standard.integer(forKey: nameGame + "record")
        stateRecord.isHidden = valueRecord == 0 ? true : false
        valueRecordLabel.text = "\(valueRecord)"
    }
}
