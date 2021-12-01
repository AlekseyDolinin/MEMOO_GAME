import UIKit
import AVFoundation

let nRestart: NSNotification.Name = NSNotification.Name(rawValue: "nRestart")
let nBack: NSNotification.Name = NSNotification.Name(rawValue: "nBack")

class GameViewController: UIViewController {
    
    var viewSelf: GameView! {
        guard isViewLoaded else {return nil}
        return (view as! GameView)
    }
     
    var countCell = 20
    var arrayCard = [Card]()
    var matchCount: Int = 0
    var timeDelayHideContent = 3.0
    var tempIndexPath: IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSelf.cardCollection.delegate = self
        viewSelf.cardCollection.dataSource = self
                
        NotificationCenter.default.addObserver(forName: nRestart, object: nil, queue: nil) { notification in
            self.restart()
        }
        
        NotificationCenter.default.addObserver(forName: nBack, object: nil, queue: nil) { notification in
            self.outGame()
        }
    }
    
    ///
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        restart()
        Sound.playBackgroundSound()
    }
    
    ///
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewSelf.showTopBar()
    }

    override func viewWillDisappear(_ animated: Bool) {
        Sound.removePlayers()
    }
    
    ///
    func restart() {
        hideAllCards()
        loadCards {
            startGame()
        }
    }
    
    ///
    func outGame() {
        self.dismiss(animated: true) {
        }
    }
    
    ///
    func loadCards(completion: () -> ()) {
        arrayCard = []
        while arrayCard.count < countCell {
            let index: Int = Int(arc4random() % 20 + 1) // 20 - количество изображений в папке
            let image: UIImage = UIImage(named: "\(StartViewController.selectRound.name)_\(index)") ?? UIImage()
            let card = Card(id: index, image: image, showCard: false)
            let indexes = arrayCard.map { $0.id }
            if !indexes.contains(index) {
                arrayCard.append(card)
                arrayCard.append(card)
            }
        }
        arrayCard = arrayCard.shuffled()
        completion()
    }
    
    ///
    func gameWin() {
        DispatchQueue.main.async {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WinViewController") as! WinViewController
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true)
        }
    }
    
    func startGame() {
        showAllCards()
        DispatchQueue.main.asyncAfter(deadline: .now() + timeDelayHideContent) {
            self.hideAllCards()
        }
        matchCount = 0
    }
    
    func hideAllCards() {
        for i in 0..<self.arrayCard.count {
            self.arrayCard[i].showCard = false
        }
        viewSelf.cardCollection.reloadData()
    }
    
    func showAllCards() {
        for i in 0..<self.arrayCard.count {
            self.arrayCard[i].showCard = true
        }
    }
    
    func countMatch() {
        matchCount += 1
        if matchCount == (countCell / 2) {
            gameWin()
        }
    }
    
    @IBAction func showMenu(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GameMenuViewController") as! GameMenuViewController
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: false)
    }
}
