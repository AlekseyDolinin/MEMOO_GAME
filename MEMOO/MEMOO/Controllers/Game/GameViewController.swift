import UIKit

class GameViewController: UIViewController {
    
    var viewSelf: GameView! {
        guard isViewLoaded else {return nil}
        return (view as! GameView)
    }
    
    var countCell = 20
    var arrayCard = [Card]()
    var timer: Timer!
    
    var matchCount: Int = 0
    var score: Int = 0
    var timeCountValue: Int = 0
    var timeDelayHideContent = 3.0
    var speedTimer = 1.0
    
    var tempIndexPath: IndexPath!
    var nameGame: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSelf.cardCollection.delegate = self
        viewSelf.cardCollection.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(restart), name: NSNotification.Name(rawValue: "restart"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(back), name: NSNotification.Name(rawValue: "back"), object: nil)

        viewSelf.nameGame = self.nameGame
        viewSelf.setRecordLabel()        
    }
    
    ///
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("Выбрана: \(nameGame!)")
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
        if self.timer != nil {
            self.timer.invalidate()
        }
        hideAllCards()
        loadCards {
            startGame()
        }
    }
    
    ///
    @objc func timeCount() {
        timeCountValue = Int(viewSelf.timerLabel!.text!) ?? 0
        if timeCountValue <= 0 {
            gameLose()
        } else {
            timeCountValue = timeCountValue - 1
        }
        DispatchQueue.main.async {
            self.viewSelf.timerLabel.text = String(self.timeCountValue)
        }
    }
    
    ///
    func loadCards(completion: () -> ()) {
        arrayCard = []
        while arrayCard.count < countCell {
            let index: Int = Int(arc4random() % 20 + 1) // 20 - количество изображений в папке
            let image = UIImage(named: "\(nameGame!)\(index)")!
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
    func startTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: speedTimer, target: self, selector: #selector(timeCount), userInfo: nil, repeats: true)
    }
    
    ///
    func gameLose() {
        self.timer.invalidate()
        DispatchQueue.main.async {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoseViewController") as! LoseViewController
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true)
        }
    }
    
    ///
    func gameWin() {
        self.timer.invalidate()
        let totalScore = score + timeCountValue
        print("game: \(nameGame!)")
        print("score: \(score)")
        print("total score: \(totalScore)")
        
        let oldRecord = UserDefaults.standard.integer(forKey: nameGame + "record")
        
        if totalScore > oldRecord {
            print("Рекорд побит")
            /// запись рекорда
            UserDefaults.standard.set(totalScore, forKey: (nameGame + "record"))
        }
        DispatchQueue.main.async {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WinViewController") as! WinViewController
            vc.nameGame = self.nameGame
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true)
        }
    }
    
    func startGame() {
        showAllCards()
        DispatchQueue.main.asyncAfter(deadline: .now() + timeDelayHideContent) {
            self.hideAllCards()
            self.startTimer()
        }
        matchCount = 0
        viewSelf.scoreLabel.text = "SCORE: \(matchCount)"
        viewSelf.timerLabel.text = "60"
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
        score += 1
        viewSelf.scoreLabel.text = "SCORE: \(matchCount)"
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
