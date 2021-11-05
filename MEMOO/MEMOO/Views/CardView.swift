import UIKit

class CardView: UIImageView {
    
    var cardImage: UIImage?
    var cardTag: NSInteger?

    required init(coder aDecoder: NSCoder) {
        super.init(coder :aDecoder)!
        self.isUserInteractionEnabled = true
    }
    
    func showCard() {
        print("showCard")
        self.image = UIImage(named: "fruit1.png")
        UIView.transition(with: self, duration: 0.5, options: .transitionFlipFromRight, animations: {
            self.image = UIImage(named: "fruit1")
        }, completion: { (finished) in
            self.isUserInteractionEnabled = false
        })
    }
    
    func hideCard() {
        print("hideCard")
        UIView.transition(with: self, duration: 0.5, options: .transitionFlipFromRight, animations: {
            self.image = UIImage(named: "backCard")
        }, completion: { (finished) in
            self.isUserInteractionEnabled = true
        })
    }
}
