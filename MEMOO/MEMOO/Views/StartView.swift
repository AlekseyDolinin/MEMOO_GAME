import UIKit
import SpriteKit

class StartView: UIView {

    @IBOutlet weak var collectionRound: UICollectionView!
    @IBOutlet weak var layer_1: UIImageView!
    @IBOutlet weak var layer_2: UIImageView!
    @IBOutlet weak var layer_3: UIImageView!
    @IBOutlet weak var viewForSKEmitter: UIView!
    
    var showAnimation = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
        setAnimation()
        
        
        let width = collectionRound.collectionViewLayout.collectionViewContentSize.width
        print("width: \(width)")
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
//        ///
//        descriptionView.layer.cornerRadius = descriptionView.frame.height / 2
//        easilyView.layer.cornerRadius = easilyView.frame.height / 2
//        mediumView.layer.cornerRadius = mediumView.frame.height / 2
//        hardView.layer.cornerRadius = hardView.frame.height / 2
    }
}
