import UIKit

class RoundCell: UICollectionViewCell {

    @IBOutlet weak var imageContent: UIImageView!
    @IBOutlet weak var back: UIView!
    @IBOutlet weak var lockImage: UIImageView!
    @IBOutlet weak var complexityView: UIView!
    
    var round: Round!
    var nameGame: String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    func setCell() {
        setCoverImage()
        setComplexity()
        setBlocked()
    }
    
    ///
    func setCoverImage() {
        imageContent.image = UIImage(named: round.imageCover)
    }
    
    ///
    func setComplexity() {
        switch round.complexity {
        case .easily:
            print("easily")
        case .medium:
            print("medium")
        case .hard:
            print("hard")
        }
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

extension RoundCell {
    ///
    func setUI() {
        /// color
        
        ///
        lockImage.image = UIImage(named: "lock")?.withRenderingMode(.alwaysTemplate)
        lockImage.tintColor = .Brown_
        
        ///
        back.layer.cornerRadius = 16
        back.clipsToBounds = true
        complexityView.layer.cornerRadius = complexityView.frame.height / 2
    }

}
