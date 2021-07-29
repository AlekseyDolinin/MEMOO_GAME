import UIKit

extension StartViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let gameCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCell", for: indexPath) as! GameCell
        gameCell.label.text = String(indexPath.row)
        gameCell.setCell()
        return gameCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        
        switch indexPath.row {
        case 0:
            let vc = storyboard?.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = storyboard?.instantiateViewController(withIdentifier: "OldGameViewController") as! OldGameViewController
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
}
