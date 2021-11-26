import UIKit
import SpriteKit

class StartView: UIView {

    @IBOutlet weak var collectionRound: UICollectionView!
    @IBOutlet weak var layer_1: UIImageView!
    @IBOutlet weak var layer_2: UIImageView!
    @IBOutlet weak var layer_3: UIImageView!
    @IBOutlet weak var viewForSKEmitter: SKView!
    @IBOutlet weak var viewLeftFire: SKView!
    @IBOutlet weak var viewRightFire: SKView!
    
    @IBOutlet weak var showCollectionButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
        setAnimationMagic()
        setAnimationLeftFire()
        setAnimationRightFire()
        setAnimationClouds()
    }
    
    ///
    func setAnimationMagic() {
        let emitter = SKEmitterNode(fileNamed: "magic.sks")
        emitter?.position = viewForSKEmitter.center
        emitter?.particleBirthRate = 20
        let scene: SKScene = SKScene(size: self.viewForSKEmitter.frame.size)
        scene.scaleMode = .aspectFit
        scene.backgroundColor = .clear
        scene.addChild(emitter!)
        viewForSKEmitter.presentScene(scene)
    }
    
    ///
    func setAnimationLeftFire() {
        let emitter = SKEmitterNode(fileNamed: "fire.sks")
        emitter?.position = CGPoint(x: 25, y: 10)
        let scene: SKScene = SKScene(size: self.viewLeftFire.frame.size)
        scene.scaleMode = .aspectFill
        scene.backgroundColor = .clear
        scene.addChild(emitter!)
        viewLeftFire.presentScene(scene)
    }
    
    ///
    func setAnimationRightFire() {
        let emitter = SKEmitterNode(fileNamed: "fire.sks")
        emitter?.position = CGPoint(x: 25, y: 10)
        let scene: SKScene = SKScene(size: self.viewRightFire.frame.size)
        scene.scaleMode = .aspectFit
        scene.backgroundColor = .clear
        scene.addChild(emitter!)
        viewRightFire.presentScene(scene)
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
