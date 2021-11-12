import UIKit

class StartView: UIView {

    @IBOutlet weak var contentGameCollection: UICollectionView!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var easilyView: UIView!
    @IBOutlet weak var mediumView: UIView!
    @IBOutlet weak var hardView: UIView!
    @IBOutlet weak var easilyLabel: UILabel!
    @IBOutlet weak var mediumLabel: UILabel!
    @IBOutlet weak var hardLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
}


extension StartView {
    func setUI() {
        
        
        ///
        descriptionView.layer.cornerRadius = descriptionView.frame.height / 2
        easilyView.layer.cornerRadius = easilyView.frame.height / 2
        mediumView.layer.cornerRadius = mediumView.frame.height / 2
        hardView.layer.cornerRadius = hardView.frame.height / 2
    }
}
