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
    var tempCell: CardCell!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSelf.cardCollection.delegate = self
        viewSelf.cardCollection.dataSource = self
    }
    
    ///
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        reloadGame()
    }
    
    ///
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewSelf.showTopBar()
        
        print("home")
    }
    
    ///
    @objc func timeCount() {
        var timeCount = Int(viewSelf.timerLabel!.text!) ?? 0
        if timeCount <= 0 {
            self.timer.invalidate()
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
        let images = randomImages()
        var id = 0
        for i in 0...9 {
            let cardFirst = Card(id: id, image: images[i] as! UIImage, showCard: true)
            id += 1
            let cardSecond = Card(id: id, image: images[i] as! UIImage, showCard: true)
            id += 1
            arrayCard.append(cardFirst)
            arrayCard.append(cardSecond)
        }
        arrayCard = arrayCard.shuffled()
        completion()
    }
    
    ///
    func startTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeCount), userInfo: nil, repeats: true)
    }
    
    ///
    func showAlert(title: String? = nil, message: String? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Close", style: .default) { (UIAlertAction) in
            self.reloadGame()
        }
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
    
    ///
    func gameOver() {
        self.timer.invalidate()
        showAlert(title: "GAME OVER!")
    }
    
    ///
    func gameWin() {
        showAlert(title: "WIN!")
        self.timer.invalidate()
    }
    
    ///
    func reloadGame() {
        loadCards {
            startGame()
            showAllCards()
        }
    }
    
    func startGame() {
        viewSelf.cardCollection.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.hideAllCards()
//            self.startTimer()
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
        viewSelf.cardCollection.reloadData()
    }
    
    func countMatch() {
        matchCount = matchCount + 1
        viewSelf.scoreLabel.text = "SCORE: \(matchCount)"
        if matchCount == (countCell / 2) {
//            gameWin()
        }
    }
    
    ///
    @IBAction func back(sender: UIButton?) {
        
        let alert = UIAlertController(title: "Закончить игру?", message: nil, preferredStyle: .alert)
        let endGameAction = UIAlertAction(title: "Закончить", style: .default) { (UIAlertAction) in
            self.navigationController?.popViewController(animated: true)
        }
        let continueAction = UIAlertAction(title: "Продолжить", style: .default) { (UIAlertAction) in
            self.view.endEditing(true)
        }
        let reloadAction = UIAlertAction(title: "Начать заново", style: .default) { (UIAlertAction) in
            self.reloadGame()
        }
        alert.addAction(endGameAction)
        alert.addAction(continueAction)
        alert.addAction(reloadAction)
        present(alert, animated: true)
    }
    
    @IBAction func showMenu(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: false)
    }
}
