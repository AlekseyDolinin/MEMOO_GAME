import UIKit

class ArtefactCell: UICollectionViewCell {
    
    @IBOutlet weak var artefactImage: CardView!
    
    var artefact: Artefact!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    func setCell() {
        artefactImage.image = artefact.image
    }

}

extension ArtefactCell {
    func setUI() {
        /// color
        

        ///
    }
}
