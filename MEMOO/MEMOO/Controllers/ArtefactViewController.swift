import UIKit

class ArtefactViewController: UIViewController {

    var viewSelf: ArtefactView! {
        guard isViewLoaded else {return nil}
        return (view as! ArtefactView)
    }
    
    var artefactsArray = [Artefact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewSelf.artefactCollection.delegate = self
        viewSelf.artefactCollection.dataSource = self
        
        for i in 1...40 {
            let artefact = Artefact(id: 0,
                                    image: UIImage(named: "artefact_\(i)") ?? UIImage(),
                                    nameArtefact: "nameArtefact",
                                    descriptionArtefact: "descriptionArtefact")
            artefactsArray.append(artefact)
            
            viewSelf.artefactCollection.reloadData()
        }
    }

    ///
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true) {
            
        }
    }
}
