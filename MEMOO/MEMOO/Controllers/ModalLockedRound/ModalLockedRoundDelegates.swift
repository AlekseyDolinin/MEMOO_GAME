import UIKit

extension ModalLockedRoundViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countCell
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let previewRoundCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PreviewRoundCell", for: indexPath) as! PreviewRoundCell
        previewRoundCell.imageCard.image = UIImage(named: "\(round.name)_\(indexPath.row + 1)")
        return previewRoundCell
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
