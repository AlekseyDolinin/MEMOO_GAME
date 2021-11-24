import UIKit

class ArtefactViewController: UIViewController {

    var viewSelf: ArtefactView! {
        guard isViewLoaded else {return nil}
        return (view as! ArtefactView)
    }
    
    var selectRound: Round!
    var countCell = 33
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewSelf.artefactCollection.delegate = self
        viewSelf.artefactCollection.dataSource = self
    }

    ///
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true) {
            
        }
    }
}


extension ArtefactViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countCell
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let artefactCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArtefactCell", for: indexPath) as! ArtefactCell
        return artefactCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "PreviewArtefactViewController") as! PreviewArtefactViewController
        vc.modalPresentationStyle = .pageSheet
        present(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthCell = (collectionView.frame.width / 3 - 20)
        return CGSize(width: widthCell, height: widthCell)
    }
}


import UIKit

class ArtefactView: UIView {
    
    @IBOutlet weak var artefactCollection: UICollectionView!
        
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func showTopBar() {

    }
}
