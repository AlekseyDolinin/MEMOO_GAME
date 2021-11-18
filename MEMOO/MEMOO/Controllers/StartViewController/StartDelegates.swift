import UIKit

extension StartViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listGame.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let roundCell = collectionView.dequeueReusableCell(withReuseIdentifier: "RoundCell", for: indexPath) as! RoundCell
        roundCell.nameGame = listGame[indexPath.row]
        roundCell.setCell()
        /// разблокировка первых 2-х ячеек
        roundCell.lockImage.isHidden = [0, 1, 2, 3].contains(indexPath.row)
        return roundCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        StartViewController.nameGame = listGame[indexPath.row]
        openGame()
        
//        /// free content
//        if (["fruit_", "emoji_"]).contains(StartViewController.nameGame) || StartViewController.unlockAllGame == true {
//            openGame()
//        } else {
//            /// проверка есть ли запись о просмотре рекламы
//            /// если записи нет - показ рекламы
//            /// если запись есть - переход к игре
//            let dateSeeADVString = UserDefaults.standard.object(forKey: StartViewController.nameGame + "date")
//            print(dateSeeADVString ?? "Игра заблокирована")
//            if dateSeeADVString == nil {
//                showADS()
//            } else {
//                openGame()
//            }
//        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width - 100
        return CGSize(width: width, height: collectionView.frame.height)
    }
}


extension StartViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.lastContentOffset = scrollView.contentOffset.x
        
        viewSelf.layer_1.transform = CGAffineTransform(translationX: -self.lastContentOffset * 0.6, y: 0)
        viewSelf.viewForSKEmitter.transform = CGAffineTransform(translationX: -self.lastContentOffset * 0.35, y: 0)
        viewSelf.layer_2.transform = CGAffineTransform(translationX: -self.lastContentOffset * 0.3, y: 0)
        viewSelf.layer_3.transform = CGAffineTransform(translationX: -self.lastContentOffset * 0.15, y: 0)
    }
}
