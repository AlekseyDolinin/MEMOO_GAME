import UIKit

class ArtefactCell: UICollectionViewCell {
    
    @IBOutlet weak var artefactImage: CardView!
    @IBOutlet weak var nameArtefact: UILabel!
    
    var artefact: Artefact!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    func setCell() {
        artefactImage.image = artefact.image
        nameArtefact.text = artefact.nameArtefact
    }

}

extension ArtefactCell {
    func setUI() {
        /// color
        

        ///
    }
}
