import UIKit

class OldGameViewController: UIViewController {

    var gameView: GameView! {
        guard isViewLoaded else {return nil}
        return (view as! GameView)
    }
    
    var timer: Timer!
    var matchCount: Int = 0
    var isGameOver: Bool = false
    var tempImageView: CardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareTimeCount()
        self.doRefresh(sender: nil)
    }
    
    func loadFruits() {
        let tags = randomTags()
        let images = randomImages()
        var index = 0
        for i in 0...9 {
            let image: UIImage = images[i] as! UIImage
            let cardFirst = self.view.viewWithTag( tags[index] as! Int) as! CardView
            index += 1
            let cardSecond = self.view.viewWithTag( tags[index] as! Int) as! CardView
            index += 1
            cardFirst.cardImage = image
            cardSecond.cardImage = image
            cardFirst.cardTag = i
            cardSecond.cardTag = i
        }
    }
    
    func randomTags() -> NSArray {
        let mArr: NSMutableArray =  NSMutableArray()
        while(mArr.count < 20) {
            let tag = arc4random() % 20 + 100
            let t = NSNumber(value: tag)
            if !mArr.contains(t) {
                mArr.add(t)
            }
        }
        return mArr
    }
    
    func randomImages() -> NSArray {
        let images = NSMutableArray()
        while images.count < 10 {
            let i = arc4random() % 18 + 1
            let image: UIImage = UIImage(named: "fruit\(i).png")!
            if !images.contains(image) {
                images.add(image)
            }
        }
        return images
    }
    
    func turnAll2Left() {
        print("turnAll2Left")
        for i in 100...119 {
            let myI  = self.view.viewWithTag(i) as! CardView
            myI.showCard()
        }
    }
    
    func turnAll2Right() {
        print("turnAll2Right")
        for i in 100...119
        {
            let myI  = self.view.viewWithTag(i) as! CardView
            myI.hideCard()
        }
    }

    
    func prepareTimeCount() {
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timeCount), userInfo: nil, repeats: true)
    }
    
    @objc func timeCount() {
        var timeCount = Int(gameView.timeCountLabel!.text!) ?? 0
        if timeCount <= 0 {
            self.timer.invalidate()
            self.gameOver()
        } else {
            timeCount -= 1
        }
        
    }
    
    func gameOver() {
        self.isGameOver = true
        self.timer.invalidate()
        let alert : UIAlertController! = UIAlertController(title: " Oh! No~````", message: "竟然失败了~`!", preferredStyle: .alert)
        let alertAction :UIAlertAction = UIAlertAction(title:"再来一次",style:.default,handler:  {
            (UIAlertAction)->Void in self.doRefresh(sender: nil)
        })
        alert.addAction(alertAction)
        self.present(alert,animated: true,completion: nil)
    }
    
    func gameWin() {
        self.isGameOver = true
        self.timer.invalidate()
    }

    
    @IBAction func doRefresh(sender : UIButton?) {
        
        gameView.timeCountLabel.text = "60"
        self.matchCount = 0
        self.tempImageView = nil
        if(isGameOver || timer == nil) {
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timeCount), userInfo: nil, repeats: true)
            self.isGameOver = false
        }
        self.loadFruits()
        
        self.turnAll2Left()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.turnAll2Right()
        }
    }
}

