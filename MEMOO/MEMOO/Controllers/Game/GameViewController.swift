import UIKit

class GameViewController: UIViewController {
    
    var gameView: GameView_! {
        guard isViewLoaded else {return nil}
        return (view as! GameView_)
    }
    
    var countCell = 20
    var arrayCard = [Card]()
    
    var content: String!
//    var countAllCard: UInt32!
    
    var timer: Timer!
    var matchCount: Int = 0
//    var isGameOver: Bool = false
    
    var tempCell: CardCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameView.cardCollection.delegate = self
        gameView.cardCollection.dataSource = self
    }
    
    ///
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        reloadGame()
    }
    
    ///
    @objc func timeCount() {
        var timeCount = Int(gameView.timerLabel!.text!) ?? 0
        if timeCount <= 0 {
            self.timer.invalidate()
            self.gameOver()
        } else {
            timeCount = timeCount - 1
        }
        gameView.timerLabel.text = String(timeCount)
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
        gameView.cardCollection.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.hideAllCards()
            self.startTimer()
        }
        gameView.timerLabel.text = "60"
        matchCount = 0
    }
    
    func hideAllCards() {
        for i in 0..<self.arrayCard.count {
            self.arrayCard[i].showCard = false
        }
        gameView.cardCollection.reloadData()
    }
    
    func showAllCards() {
        for i in 0..<self.arrayCard.count {
            self.arrayCard[i].showCard = true
        }
        gameView.cardCollection.reloadData()
    }
    
    func countMatch() {
        matchCount = matchCount + 1
        print("Match: \(matchCount)")
        if matchCount == (countCell / 2) {
            gameWin()
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
}
