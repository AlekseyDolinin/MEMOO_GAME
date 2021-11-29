import UIKit

extension StartViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listRounds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let roundCell = collectionView.dequeueReusableCell(withReuseIdentifier: "RoundCell", for: indexPath) as! RoundCell
        roundCell.round = listRounds[indexPath.row]
        roundCell.setCell()
        return roundCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let round = listRounds[indexPath.row]
        StartViewController.selectRound = round
        round.state == .buy ? openGame() : openModalLockedRound()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthCell = view.frame.width - 100
        return CGSize(width: widthCell, height: collectionView.frame.height)
    }
}


extension StartViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.lastContentOffset = scrollView.contentOffset.x
        viewSelf.layer_1.transform = CGAffineTransform(translationX: -self.lastContentOffset * 0.45, y: 0)
        viewSelf.layer_2.transform = CGAffineTransform(translationX: -self.lastContentOffset * 0.17, y: 0)
        viewSelf.layer_3.transform = CGAffineTransform(translationX: -self.lastContentOffset * 0.05, y: 0)
    }
}
