import UIKit

extension StartViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listGame.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let gameCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCell", for: indexPath) as! GameCell
        gameCell.nameGame = listGame[indexPath.row]
        gameCell.setCell()
        return gameCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        StartViewController.nameGame = listGame[indexPath.row]
        
        /// free content
        if (["fruit_", "emoji_"]).contains(StartViewController.nameGame) {
            openGame()
        } else {
            /// проверка есть ли запись о просмотре рекламы
            /// если записи нет - показ рекламы
            /// если запись есть - переход к игре
            let dateSeeADVString = UserDefaults.standard.object(forKey: StartViewController.nameGame + "date")
            print(dateSeeADVString ?? "Игра заблокирована")
            if dateSeeADVString == nil {
                showADS()
            } else {
                openGame()
            }
        }
    }
}
