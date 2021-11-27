import UIKit

class ArtefactCell: UICollectionViewCell {
    
    @IBOutlet weak var artefactImage: CardView!
    
    var index: Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    func setCell() {
        guard let indexArtefact = index else {
            return
        }
        artefactImage.image = UIImage(named: "artefact_\(indexArtefact + 1)")
    }

}

extension ArtefactCell {
    func setUI() {
        /// color
        

        ///
    }
}
