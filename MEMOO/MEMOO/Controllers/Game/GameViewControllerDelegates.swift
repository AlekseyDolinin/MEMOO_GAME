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
        
        /// нет открытой карты
        if self.tempIndexPath == nil {
            self.tempIndexPath = indexPath.row
            arrayCard[indexPath.row].showCard = true
            guard let selectCell = collectionView.cellForItem(at: indexPath) as? CardCell else { return }
            selectCell.show()
        } else { /// есть открытая карта
            /// исключение повторного нажатия
            if tempIndexPath == indexPath.row { return }
            
            guard let selectCell = collectionView.cellForItem(at: indexPath) as? CardCell else { return }
            selectCell.show()
            
            /// совпадение
            if arrayCard[tempIndexPath].id == arrayCard[indexPath.row].id {
                tempIndexPath = nil
                countMatch()
            } else {
                guard let tempCell = collectionView.cellForItem(at: IndexPath(item: tempIndexPath, section: 0)) as? CardCell else { return }
                tempCell.hide()
                arrayCard[tempIndexPath].showCard = false
                tempIndexPath = indexPath.row
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
