import UIKit
import AVFoundation

let nReloadRound: NSNotification.Name = NSNotification.Name(rawValue: "nReloadRound")
let nBackHome: NSNotification.Name = NSNotification.Name(rawValue: "nBackHome")

class GameViewController: UIViewController {
    
    var viewSelf: GameView! {
        guard isViewLoaded else {return nil}
        return (view as! GameView)
    }
    
//    var round: Round!
    var countCell = 20
    var arrayCard = [Card]()
    var matchCount: Int = 0
    var timeDelayHideContent = 3.0
    var tempIndexPath: IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSelf.cardCollection.delegate = self
        viewSelf.cardCollection.dataSource = self
                
        NotificationCenter.default.addObserver(forName: nReloadRound, object: nil, queue: nil) { notification in
            self.restart()
        }
        
        NotificationCenter.default.addObserver(forName: nBackHome, object: nil, queue: nil) { notification in
            self.outGame()
        }
    }
    
    ///
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        ///
        restart()
        if Sound.isSoundOn() {
            Sound.playBackgroundSound()
        } else {
            Sound.playBackgroundSound()
            Sound.playerBackgroundMusic?.pause()
        }
    }
    
    ///
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewSelf.showTopBar()
    }
    
    deinit {
        print("deinit GameViewController")
        Sound.removePlayers()
    }
    
    ///
    func restart() {
        StartViewController.selectRound.countErrors = 0
        hideAllCards()
        loadCards {
            startGame()
        }
    }
    
    ///
    func outGame() {
        self.dismiss(animated: true)
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
        Sound.playSoundWin()
        
        /// проверка достижений раунда
        SaveResult.checkStateRound()
        
        /// показ финального экрана
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WinViewController") as! WinViewController
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true)
        }
    }
    
    ///
    func startGame() {
        showAllCards()
        DispatchQueue.main.asyncAfter(deadline: .now() + timeDelayHideContent) {
            self.hideAllCards()
        }
        matchCount = 0
    }
    
    ///
    func hideAllCards() {
        for i in 0..<self.arrayCard.count {
            self.arrayCard[i].showCard = false
        }
        viewSelf.cardCollection.reloadData()
    }
    
    ///
    func showAllCards() {
        for i in 0..<self.arrayCard.count {
            self.arrayCard[i].showCard = true
        }
    }
    
    ///
    func countMatch() {
        matchCount += 1
        if matchCount == (countCell / 2) {
            gameWin()
        }
    }
    
    func countErrors() {
        StartViewController.selectRound.countErrors += 1
    }
    ///
    @IBAction func showMenu(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "GameMenuViewController") as! GameMenuViewController
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: false)
    }
}
