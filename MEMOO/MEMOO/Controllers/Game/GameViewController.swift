import UIKit

class GameViewController: UIViewController {
    
    var viewSelf: GameView! {
        guard isViewLoaded else {return nil}
        return (view as! GameView)
    }
    
    var nameCard: String!
    var countCell = 20
    var arrayCard = [Card]()
    var timer: Timer!
    var matchCount: Int = 0
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
        var timeCount = Int(viewSelf.timerLabel!.text!) ?? 0
        if timeCount <= 0 {
            self.gameOver()
        } else {
            timeCount = timeCount - 1
        }
        DispatchQueue.main.async {
            self.viewSelf.timerLabel.text = String(timeCount)
        }
    }
    
    ///
    func loadCards(completion: () -> ()) {
        arrayCard = []
        while arrayCard.count < countCell {
            let index: Int = Int(arc4random() % 20 + 1) // 20 - количество изображений в папке
            let image = UIImage(named: "\(nameCard!)\(index)")!
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
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeCount), userInfo: nil, repeats: true)
        print(self.timer.timeInterval)
    }
    
    ///
    func showAlert(title: String? = nil, message: String? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Close", style: .default) { (UIAlertAction) in
            self.back()
        }
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
    
    ///
    func gameOver() {
        self.timer.invalidate()
        DispatchQueue.main.async {
            self.showAlert(title: "GAME OVER!")
        }
    }
    
    ///
    func gameWin() {
        self.timer.invalidate()
        DispatchQueue.main.async {
            self.showAlert(title: "WIN!")
        }
    }
    
    func startGame() {
        showAllCards()
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
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
        matchCount = matchCount + 1
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
