import UIKit

class ViewController_2: UIViewController {

    @IBOutlet weak var layer_1: UIImageView!
    @IBOutlet weak var layer_2: UIImageView!
    @IBOutlet weak var layer_3: UIImageView!
    @IBOutlet weak var collectionRound: UICollectionView!
    
    private var lastContentOffset: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionRound.delegate = self
        collectionRound.dataSource = self
    }


}



extension ViewController_2: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let roundCell = collectionView.dequeueReusableCell(withReuseIdentifier: "RoundCell", for: indexPath) as! RoundCell
        
        return roundCell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - 100
        return CGSize(width: width, height: collectionView.frame.height)
    }
    
}



extension ViewController_2: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (self.lastContentOffset > scrollView.contentOffset.x) {
            print(11)
        } else if (self.lastContentOffset < scrollView.contentOffset.x) {
            print(22)
        }

        // update the new position acquired
        self.lastContentOffset = scrollView.contentOffset.x
        
        layer_1.transform = CGAffineTransform(translationX: -self.lastContentOffset * 0.6, y: 0)
        layer_2.transform = CGAffineTransform(translationX: -self.lastContentOffset * 0.3, y: 0)
        layer_3.transform = CGAffineTransform(translationX: -self.lastContentOffset * 0.15, y: 0)
    }
    
    
}
