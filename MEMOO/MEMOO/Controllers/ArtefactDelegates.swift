import UIKit

extension ArtefactViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return artefactsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let artefactCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArtefactCell", for: indexPath) as! ArtefactCell
        artefactCell.artefact = artefactsArray[indexPath.row]
        artefactCell.setCell()
        return artefactCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "PreviewArtefactViewController") as! PreviewArtefactViewController
        vc.modalPresentationStyle = .overFullScreen
        vc.artefact = artefactsArray[indexPath.row]
        present(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthCell = (collectionView.frame.width / 3 - 20)
        return CGSize(width: widthCell, height: widthCell + 18)
    }
}
