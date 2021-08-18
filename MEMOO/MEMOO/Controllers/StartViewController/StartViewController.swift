import UIKit
import GoogleMobileAds

class StartViewController: UIViewController, GADRewardBasedVideoAdDelegate {
    
    var viewSelf: StartView! {
        guard isViewLoaded else {return nil}
        return (view as! StartView)
    }
    
    var listGame: [(name: String, blocked: Bool, record: Int)] = []
    var currentIndex = 0
    var AdUnitID: String!
    
    let valuePeriodWithooutADVInSeconds = 60
    
    static var fruitRecord = 0
    static var emojiRecord = 0
    static var animalRecord = 0
    static var dinossaurRecord = 0
    static var monsterRecord = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GADRewardBasedVideoAd.sharedInstance().delegate = self
        viewSelf.contentGameCollection.delegate = self
        viewSelf.contentGameCollection.dataSource = self
        
        viewSelf.contentGameCollection.collectionViewLayout = SnapPagingLayout(
            centerPosition: true,
            peekWidth: 40,
            spacing: 20,
            inset: 40
        )
        
        #if DEBUG
        AdUnitID = "ca-app-pub-3940256099942544/1712485313"
        #else
        AdUnitID = "ca-app-pub-8093774413708674/3028809513"
        #endif
        GADRewardBasedVideoAd.sharedInstance().load(GADRequest(), withAdUnitID: AdUnitID)
    }
    
    ///
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        StartViewController.fruitRecord = UserDefaults.standard.integer(forKey: "fruit_")
        StartViewController.emojiRecord = UserDefaults.standard.integer(forKey: "emoji_")
        StartViewController.animalRecord = UserDefaults.standard.integer(forKey: "animal_")
        StartViewController.dinossaurRecord = UserDefaults.standard.integer(forKey: "dinosaur_")
        StartViewController.monsterRecord = UserDefaults.standard.integer(forKey: "monster_")
        
        createListGame()
        viewSelf.contentGameCollection.reloadData()
    }
    
    ///
    func createListGame() {
        
        listGame = [(name: "fruit_", blocked: false, record: StartViewController.fruitRecord),
                    (name: "emoji_", blocked: false, record: StartViewController.emojiRecord),
                    (name: "animal_", blocked: setBlocked(key: "animal_"), record: StartViewController.animalRecord),
                    (name: "dinosaur_", blocked: setBlocked(key: "dinosaur_"), record: StartViewController.dinossaurRecord),
                    (name: "monster_", blocked: setBlocked(key: "monster_"), record: StartViewController.monsterRecord)]
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
