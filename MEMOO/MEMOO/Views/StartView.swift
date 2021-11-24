import UIKit
import SpriteKit

class StartView: UIView {

    @IBOutlet weak var collectionRound: UICollectionView!
    @IBOutlet weak var layer_1: UIImageView!
    @IBOutlet weak var layer_2: UIImageView!
    @IBOutlet weak var layer_3: UIImageView!
    @IBOutlet weak var viewForSKEmitter: UIView!
    @IBOutlet weak var showCollectionButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
        setAnimation()
        setAnimationClouds()
    }
    
    ///
    func setAnimation() {
        let skView: SKView = SKView(frame: viewForSKEmitter.frame)
        skView.backgroundColor = .clear
        viewForSKEmitter.addSubview(skView)
        let emitter = SKEmitterNode(fileNamed: "magic.sks")
        emitter?.position = skView.center
        emitter?.particleBirthRate = 80
        emitter?.particlePositionRange.dx = viewForSKEmitter.frame.width
        emitter?.particlePositionRange.dy = viewForSKEmitter.frame.height
        let scene: SKScene = SKScene(size: self.viewForSKEmitter.bounds.size)
        scene.scaleMode = .aspectFit
        scene.backgroundColor = .clear
        scene.addChild(emitter!)
        skView.presentScene(scene)
    }
}

extension StartView {
    func setUI() {

    }
}

extension StartView {
    func setAnimationClouds() {
        
        UIView.animate(withDuration: 100.0) {
            self.layer_3.transform = CGAffineTransform(translationX: -2500, y: 0)
        } completion: { bool in
            self.layer_3.transform = .identity
            self.setAnimationClouds()
        }
    }
}
