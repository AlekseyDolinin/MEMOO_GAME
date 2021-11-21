import UIKit

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
        
        NotificationCenter.default.addObserver(self, selector: #selector(restart), name: NSNotification.Name(rawValue: "restart"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(back), name: NSNotification.Name(rawValue: "back"), object: nil)
    }
    
    ///
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("Выбрана: \(StartViewController.selectRound.name)")
        restart()
    }
    
    ///
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewSelf.showTopBar()
    }
    
    ///
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    ///
    @objc func restart() {
        hideAllCards()
        loadCards {
            startGame()
        }
    }
    
    ///
    func loadCards(completion: () -> ()) {
        arrayCard = []
        while arrayCard.count < countCell {
            let index: Int = Int(arc4random() % 20 + 1) // 20 - количество изображений в папке
            let image = UIImage(named: "\(StartViewController.selectRound.name)\(index)")!
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
        let vc = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: false)
    }
}
