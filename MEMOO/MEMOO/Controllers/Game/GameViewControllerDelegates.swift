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
        if self.tempCard == nil {
            self.tempCard = arrayCard[indexPath.row]
            
        } else { /// есть открытая карта
            /// исключение повторного нажатия
            if tempCard.id == arrayCard[indexPath.row].id { return }
            
            if tempCard.tag == arrayCard[indexPath.row].tag {
                print("Match")
                tempCard = nil
            } else {
                print("Dont Match")
                tempCell.hide()
                self.tempCard = arrayCard[indexPath.row]
            }
        }
        tempCell = collectionView.cellForItem(at: indexPath) as? CardCell
        guard let cardCell = collectionView.cellForItem(at: indexPath) as? CardCell else { return }
        cardCell.show()
        
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
