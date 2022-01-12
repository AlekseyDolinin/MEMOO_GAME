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
        nameArtefact.text = artefact.nameArtefact
        setCount()
    }

}


extension ArtefactCell {
    func setUI() {
        ///
        countBack.layer.cornerRadius = countBack.frame.height / 2
    }
}
