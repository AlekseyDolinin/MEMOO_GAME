import UIKit

class ModeCell: UICollectionViewCell {

    @IBOutlet weak var imageContent: UIImageView!
    @IBOutlet weak var back: UIView!
    @IBOutlet weak var lockImage: UIImageView!
    
    var nameGame: String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    func setCell() {
        setImage()
        setBlocked()
    }
    
    ///
    func setImage() {
        
        imageContent.image = UIImage(named: nameGame + "1")
    }
    
    ///
    func setBlocked() {
//        /// free content
//        if (["fruit_", "emoji_"]).contains(nameGame) {
//            viewBlockedContent.isHidden = true
//            return
//        }
//
//        if StartViewController.unlockAllGame == true {
//            viewBlockedContent.isHidden = true
//            return
//        }
//
//        let dateSeeADVString = UserDefaults.standard.object(forKey: nameGame + "date")
//        /// nil - игра заблокирована
//        viewBlockedContent.isHidden = dateSeeADVString == nil ? false : true
    }
}

extension ModeCell {
    ///
    func setUI() {
        /// color
        
        ///
        lockImage.image = UIImage(named: "lock")?.withRenderingMode(.alwaysTemplate)
        lockImage.tintColor = .Brown_
        ///
        back.layer.cornerRadius = 16
        back.clipsToBounds = true
    }
}
