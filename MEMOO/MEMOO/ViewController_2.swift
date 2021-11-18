import UIKit
import SpriteKit

class ViewController_2: UIViewController {


    var viewSelf: ArenasView! {
        guard isViewLoaded else {return nil}
        return (view as! ArenasView)
    }
    
    private var lastContentOffset: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewSelf.collectionRound.delegate = self
        viewSelf.collectionRound.dataSource = self
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
        let width = view.frame.width - 100
        return CGSize(width: width, height: collectionView.frame.height)
    }
}

extension ViewController_2: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if (self.lastContentOffset > scrollView.contentOffset.x) {
//            print(11)
//        } else if (self.lastContentOffset < scrollView.contentOffset.x) {
//            print(22)
//        }
        // update the new position acquired
        self.lastContentOffset = scrollView.contentOffset.x
        
        viewSelf.layer_1.transform = CGAffineTransform(translationX: -self.lastContentOffset * 0.6, y: 0)
        viewSelf.viewForSKEmitter.transform = CGAffineTransform(translationX: -self.lastContentOffset * 0.35, y: 0)
        viewSelf.layer_2.transform = CGAffineTransform(translationX: -self.lastContentOffset * 0.3, y: 0)
        viewSelf.layer_3.transform = CGAffineTransform(translationX: -self.lastContentOffset * 0.15, y: 0)
    }
    
    
}


class ArenasView: UIView {
    
    @IBOutlet weak var collectionRound: UICollectionView!
    @IBOutlet weak var layer_1: UIImageView!
    @IBOutlet weak var layer_2: UIImageView!
    @IBOutlet weak var layer_3: UIImageView!
    @IBOutlet weak var viewForSKEmitter: UIView!
    
    var showAnimation = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setAnimation()
    }
    
    ///
    func setAnimation() {
        let skView: SKView = SKView(frame: viewForSKEmitter.frame)
        skView.backgroundColor = .clear
        viewForSKEmitter.addSubview(skView)
        
        let emitter = SKEmitterNode(fileNamed: "magic.sks")
        emitter?.position = skView.center
        emitter?.particleBirthRate = 100
        emitter?.particlePositionRange.dx = viewForSKEmitter.frame.width
        emitter?.particlePositionRange.dy = viewForSKEmitter.frame.height
        
        let scene: SKScene = SKScene(size: self.viewForSKEmitter.bounds.size)
        scene.scaleMode = .aspectFit
        scene.backgroundColor = .clear
        scene.addChild(emitter!)
        
        skView.presentScene(scene)
    }
}
