import UIKit
import GoogleMobileAds

class StartViewController: UIViewController, GADFullScreenContentDelegate {
    
    var viewSelf: StartView! {
        guard isViewLoaded else {return nil}
        return (view as! StartView)
    }
    
    var listGame: [(name: String, blocked: Bool, record: Int)] = []
    var currentIndex = 0
    var AdUnitID: String!
    var rewardedAd: GADRewardedAd?
    let valuePeriodWithooutADVInSeconds = 30 /// 3 часа - 10800
    
    static var fruitRecord = 0
    static var emojiRecord = 0
    static var animalRecord = 0
    static var dinossaurRecord = 0
    static var monsterRecord = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewSelf.contentGameCollection.delegate = self
        viewSelf.contentGameCollection.dataSource = self
        
        viewSelf.contentGameCollection.collectionViewLayout = SnapPagingLayout(
            centerPosition: true,
            peekWidth: 40,
            spacing: 20,
            inset: 40
        )
        self.gadRequest()
    }
    
    ///
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        createListGame()
        viewSelf.contentGameCollection.reloadData()
        print("reload_1")
    }
    
    ///
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewSelf.contentGameCollection.reloadData()
    }
    
    ///
    func createListGame() {
        
        StartViewController.fruitRecord = UserDefaults.standard.integer(forKey: "fruit_")
        StartViewController.emojiRecord = UserDefaults.standard.integer(forKey: "emoji_")
        StartViewController.animalRecord = UserDefaults.standard.integer(forKey: "animal_")
        StartViewController.dinossaurRecord = UserDefaults.standard.integer(forKey: "dinosaur_")
        StartViewController.monsterRecord = UserDefaults.standard.integer(forKey: "monster_")
        
        listGame = [(name: "fruit_", blocked: false, record: StartViewController.fruitRecord),
                    (name: "emoji_", blocked: false, record: StartViewController.emojiRecord),
                    (name: "animal_", blocked: setBlocked(key: "animal_"), record: StartViewController.animalRecord),
                    (name: "dinosaur_", blocked: setBlocked(key: "dinosaur_"), record: StartViewController.dinossaurRecord),
                    (name: "monster_", blocked: setBlocked(key: "monster_"), record: StartViewController.monsterRecord)]
        for game in listGame {
            print("Рекорд \(game.name): \(game.record)")
        }
    }
    
    ///
    func setBlocked(key: String) -> Bool {
        let dateSee: Date? = UserDefaults.standard.object(forKey: key) as? Date
        if dateSee == nil {
            return true
        }
        /// проверка как давно был просмотр рекламы
        let secondsCount = Int(Date().timeIntervalSince1970 - dateSee!.timeIntervalSince1970)
        print(">>>>> \(key): \(secondsCount)")
        if secondsCount >= valuePeriodWithooutADVInSeconds {
            UserDefaults.standard.set(nil, forKey: key)
            return true
        } else {
            return false
        }
    }
}
