import UIKit

class RoundCell: UICollectionViewCell {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var imageRound: UIImageView!
    @IBOutlet weak var lockImage: UIImageView!
    
    var round: Round!
    
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
        imageRound.image = UIImage(named: round.name + "1")
    }
    
    ///
    func setBlocked() {
        
        if round.status == .free {
            lockImage.isHidden = true
        } else {
            lockImage.isHidden = false
        }
        
        
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

extension RoundCell {
    func setUI() {
        /// color
        
        ///
        lockImage.image = UIImage(named: "lock")?.withRenderingMode(.alwaysTemplate)
        lockImage.tintColor = .Brown_
        ///
        backView.layer.cornerRadius = 16
        backView.clipsToBounds = true
    }
}
