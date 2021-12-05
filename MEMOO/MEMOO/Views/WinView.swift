import UIKit
import SpriteKit

class WinView: UIView {
    
    @IBOutlet weak var viewFirework: SKView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        setAnimationFirework()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
            self.setAnimationFirework()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.setAnimationFirework()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.setAnimationFirework()
        }
    }
}

extension WinView {
    
    ///
    func setAnimationFirework() {
        let emitter = SKEmitterNode(fileNamed: "firework.sks")
        emitter?.position = CGPoint(x: frame.width / 2, y: -15)
        let scene: SKScene = SKScene(size: self.viewFirework.frame.size)
        scene.scaleMode = .aspectFit
        scene.backgroundColor = .clear
        scene.addChild(emitter!)
        viewFirework.presentScene(scene)
    }
}
