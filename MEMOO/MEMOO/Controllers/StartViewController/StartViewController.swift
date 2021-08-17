import UIKit
import GoogleMobileAds

class StartViewController: UIViewController, GADRewardBasedVideoAdDelegate {
    
    var viewSelf: StartView! {
        guard isViewLoaded else {return nil}
        return (view as! StartView)
    }
    
    var listGame: [(name: String, blocked: Bool)] = []
    var currentIndex = 0
    var AdUnitID: String!
    
    var blockedDinosaurValue: Bool!
    var blockedMonsterValue: Bool!
    
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
        
        createListGame()
    }
    
    ///
    func createListGame() {
        
        listGame = [(name: "fruit_", blocked: false),
                    (name: "emoji_", blocked: false),
                    (name: "animal_", blocked: false),
                    (name: "dinosaur_", blocked: setBlockedMonster(key: "dateSeeADSDinosaur")),
                    (name: "monster_", blocked: setBlockedMonster(key: "dateSeeADSMonster"))]
    }
    
    ///
    func setBlockedMonster(key: String) -> Bool {
        
        let dateSee: Date? = UserDefaults.standard.object(forKey: key) as? Date
        
        if dateSee == nil {
            return true
        }
        
        /// проверка как давно был просмотр рекламы
        let secondsCount = Int(Date().timeIntervalSince1970 - dateSee!.timeIntervalSince1970)
        
        print(">>>>> \(key): \(secondsCount)")
        
        if secondsCount >= 60 {
            UserDefaults.standard.set(nil, forKey: key)
            return true
        } else {
            return false
        }
    }
}
