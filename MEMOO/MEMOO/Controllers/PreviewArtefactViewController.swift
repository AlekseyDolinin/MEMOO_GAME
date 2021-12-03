import UIKit

class PreviewArtefactViewController: UIViewController {
    
    var viewSelf: PreviewArtefactView! {
        guard isViewLoaded else {return nil}
        return (view as! PreviewArtefactView)
    }
    
    var artefact: Artefact!
    var tempartefactimage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(artefact.image)
        viewSelf.artefact = artefact
        viewSelf.configure()
    }

    ///
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true)
    }
}




import UIKit

class PreviewArtefactView: UIView {
    
    @IBOutlet weak var artefactImage: UIImageView!
    @IBOutlet weak var nameArtefact: UILabel!
    @IBOutlet weak var descriptionArtefact: UILabel!
    
    var artefact: Artefact!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure() {
        artefactImage.image = artefact.image
        nameArtefact.text = artefact.nameArtefact
        descriptionArtefact.text = artefact.descriptionArtefact
    }
}
