import UIKit

class ArtefactCell: UICollectionViewCell {
    
    @IBOutlet weak var artefactImage: CardView!
    @IBOutlet weak var nameArtefact: UILabel!
    @IBOutlet weak var countBack: UIView!
    @IBOutlet weak var countLabel: UILabel!
    
    var artefact: Artefact!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    func setCell() {
        artefactImage.image = artefact.image
        nameArtefact.text = artefact.nameArtefact
    }
    
    func setCount() {
        countBack.isHidden = artefact.countCompleted > 0 ? false : true
        countLabel.text = "\(artefact.countCompleted)"
    }
    

}

extension ArtefactCell {
    func setUI() {
        /// color
        

        ///
        countBack.layer.cornerRadius = countBack.frame.height / 2
    }
}
