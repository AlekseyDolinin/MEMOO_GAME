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
        let countArtefacts = ArtefactList.listTaskArtefactsNames.count + ArtefactList.listRoundArtefactsNames.count
        for i in 0..<countArtefacts {
            let artefact = Artefact(id: i + 1,
                                    image: UIImage(named: "artefact_\(i + 1)") ?? UIImage(),
                                    nameArtefact: allNamesArtefacts[i],
                                    descriptionArtefact: ArtefactList.listDescriptionArtefacts[allNamesArtefacts[i]] ?? "",
                                    countCompleted: checkCountCompletedTask(id: i + 1))
            artefactsArray.append(artefact)
            viewSelf.artefactCollection.reloadData()
        }
    }

    ///
    func checkCountCompletedTask(id: Int) -> Int {
        return UserDefaults.standard.integer(forKey: "artefact_\(id)")
    }
    
    ///
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
