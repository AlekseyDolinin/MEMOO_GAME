import UIKit

class GameView_: UIView {
    
    @IBOutlet weak var cardCollection: UICollectionView!
    @IBOutlet weak var timerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
//    func showCards() {
//        print("showCards")
//        for i in 100...119 {
//            let cardView = viewWithTag(i) as! CardView
//            cardView.showCard()
//        }
//    }
    
//    func hideCards() {
//        print("hideCards")
//        for i in 100...119 {
//            let cardView  = viewWithTag(i) as! CardView
//            cardView.hideCard()
//        }
//    }
    
}
