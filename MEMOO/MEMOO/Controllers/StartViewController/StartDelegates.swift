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
        
        var haveBuyContent = false
        
        StartViewController.selectRound = listRounds[indexPath.row]
        
        /// если выбран бесплатный раунд- проверка куплена ли полная версия или хотябы один раунд
        if (0...3).contains(indexPath.row) {
            /// если куплена полная версия - открытие раунда
            if StoreManager.isUnlockAllContent() == true {
                openRound()
            } else {
                /// проход по платным раундам
                for i in (4..<listRounds.count) {

                    /// если есть купленный раунд - открытие раунда
                    if listRounds[i].state == .buy {
                        print("есть купленый контент - открытие раунда")
                        openRound()
                        haveBuyContent = true
                    }
                    
                    if i == listRounds.count - 1 {
                        if haveBuyContent == false {
                            print("показ рекламы _ нет купленношго контента")
                            showADS()
                        }
                    }
                }
            }
        } else {
            /// если выбран не бесплатный раунд- проверка куплен ли этот раунд
            openRound()
        }
    }
    
    
    func openRound() {
        print("openRound()")
        StartViewController.selectRound.state == .buy ? openGame() : openModalLockedRound()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthCell = view.frame.width - 100
        return CGSize(width: widthCell, height: collectionView.frame.height)
    }
}


extension StartViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.lastContentOffset = scrollView.contentOffset.x
        viewSelf.layer_1.transform = CGAffineTransform(translationX: -self.lastContentOffset * 0.3, y: 0)
        viewSelf.layer_2.transform = CGAffineTransform(translationX: -self.lastContentOffset * 0.1, y: 0)
    }
}
