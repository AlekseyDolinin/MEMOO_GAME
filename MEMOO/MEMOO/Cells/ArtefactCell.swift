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
    
    func setCount() {
        /// пройден первый раунд
        if artefact.id == 1 {
            if UserDefaults.standard.bool(forKey: "artefact_1") == true {
                countLabel.text = "✓"
                artefactImage.image = artefact.image
            } else {
                countBack.isHidden = true
                artefactImage.image = artefact.image.noir
            }
            
        } else {
            let countComplate = UserDefaults.standard.integer(forKey: "artefact_\(artefact.id)")
            if countComplate > 0 {
                countLabel.text = String(countComplate)
                artefactImage.image = artefact.image
            } else {
                countBack.isHidden = true
                artefactImage.image = artefact.image.noir
            }
        }
    }
}

extension ArtefactCell {
    func setUI() {
        ///
        countBack.layer.cornerRadius = countBack.frame.height / 2
    }
}
