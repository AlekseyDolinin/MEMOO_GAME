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
        StartViewController.selectRound = listRounds[indexPath.row]
        if listRounds[indexPath.row].status == .free {
            openGame()
        } else {
            openModalLockedRound()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthCell = view.frame.width - 200
        return CGSize(width: widthCell, height: collectionView.frame.height)
    }
}


extension StartViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.lastContentOffset = scrollView.contentOffset.x
        viewSelf.layer_1.transform = CGAffineTransform(translationX: -self.lastContentOffset * 0.6, y: 0)
        viewSelf.layer_2.transform = CGAffineTransform(translationX: -self.lastContentOffset * 0.4, y: 0)
        viewSelf.layer_3.transform = CGAffineTransform(translationX: -self.lastContentOffset * 0.05, y: 0)
        viewSelf.viewForSKEmitter.transform = CGAffineTransform(translationX: -self.lastContentOffset * 0.30, y: 0)
        
//        if(scrollView.panGestureRecognizer.translation(in: scrollView.superview).x > 0) {
//            UIView.animate(withDuration: 0.3) {
//                self.viewSelf.showCollectionButton.transform = CGAffineTransform(translationX: 40, y: 0)
//            }
////            UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
////                self.viewSelf.showCollectionButton.transform = CGAffineTransform(translationX: 40, y: 0)
////            }) { _ in
////                self.viewSelf.showCollectionButton.transform = .identity
////            }
//        } else {
//            UIView.animate(withDuration: 0.3) {
//                self.viewSelf.showCollectionButton.transform = CGAffineTransform(translationX: -40, y: 0)
//            }
////            UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
////                self.viewSelf.showCollectionButton.transform = CGAffineTransform(translationX: -40, y: 0)
////            }) { _ in
////                self.viewSelf.showCollectionButton.transform = .identity
////            }
//        }
    }
    

    
    
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
//            self.viewSelf.showCollectionButton.transform = .identity
//        })
//    }
}
