import UIKit

class ArtefactViewController: UIViewController {

    var viewSelf: ArtefactView! {
        guard isViewLoaded else {return nil}
        return (view as! ArtefactView)
    }

    let allNamesArtefacts = ArtefactList.listTaskArtefactsNames + ArtefactList.listRoundArtefactsNames
    var artefactsArray = [Artefact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSelf.artefactCollection.delegate = self
        viewSelf.artefactCollection.dataSource = self
        for i in 0...39 {
            let artefact = Artefact(id: 0,
                                    image: UIImage(named: "artefact_\(i + 1)") ?? UIImage(),
                                    nameArtefact: allNamesArtefacts[i],
                                    descriptionArtefact: ArtefactList.listDescriptionArtefacts[allNamesArtefacts[i]] ?? "",
                                    countCompleted: checkCountCompletedTask())
            artefactsArray.append(artefact)
            viewSelf.artefactCollection.reloadData()
        }
    }

    ///
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

extension ArtefactViewController {
    
    func checkCountCompletedTask() -> Int {
        return 99
    }
}
