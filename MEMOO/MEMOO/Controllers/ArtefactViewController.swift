import UIKit

class ArtefactViewController: UIViewController {

    var viewSelf: ArtefactView! {
        guard isViewLoaded else {return nil}
        return (view as! ArtefactView)
    }
    
    var selectRound: Round!
    var countCell = 20
    
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthCell = (collectionView.frame.width / 4)
        return CGSize(width: widthCell, height: widthCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let heightCell = (collectionView.frame.width / 4)
        let totalCellHeight = CGFloat(countCell / 4) * heightCell
        let inset  = (collectionView.layer.frame.size.height - totalCellHeight) / 2
        return UIEdgeInsets(top: inset, left: 0, bottom: inset, right: 0)
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
