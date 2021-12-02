import UIKit

class PreviewArtefactViewController: UIViewController {

    @IBOutlet weak var artefactImage: UIImageView!
    
    var artefact: Artefact!
    var tempartefactimage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        artefactImage.image = tempartefactimage
    }

    ///
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
