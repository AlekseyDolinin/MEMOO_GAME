import UIKit

class GameView: UIView {

    @IBOutlet var timeCountLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func showCards() {
        print("showCards")
        for i in 100...119 {
            let cardView = viewWithTag(i) as! CardView
            cardView.showCard()
        }
    }
    
    func hideCards() {
        print("hideCards")
        for i in 100...119 {
            let cardView  = viewWithTag(i) as! CardView
            cardView.hideCard()
        }
    }
    
}
