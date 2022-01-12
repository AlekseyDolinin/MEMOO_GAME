import UIKit

extension GameViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countCell
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cardCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCell
        cardCell.card = arrayCard[indexPath.row]
        cardCell.setCell()
        return cardCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        gameWin()
//        return
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? CardCell else { return }
        /// нет открытой карты
        if tempIndexPath == nil && arrayCard[indexPath.row].showCard == false {
            arrayCard[indexPath.row].showCard = true
            tempIndexPath = indexPath
            cell.show()
            Sound.playSoundOpenCard()
            return
        }
        
        ///
        if arrayCard[indexPath.row].showCard != true {
            cell.show()
            Sound.playSoundOpenCard()
            arrayCard[indexPath.row].showCard = true
            ///
            if arrayCard[tempIndexPath.row].id != arrayCard[indexPath.row].id {
                guard let cell = collectionView.cellForItem(at: tempIndexPath) as? CardCell else { return }
                cell.hide()
                arrayCard[tempIndexPath.row].showCard = false
                tempIndexPath = indexPath
                
                /// подсчет ошибок
                countErrors()
                
            } else {
                print("match")
                tempIndexPath = nil
                countMatch()
                Sound.playSoundMath()
            }
        }
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
