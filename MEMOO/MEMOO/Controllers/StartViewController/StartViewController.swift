import UIKit
import GoogleMobileAds

class StartViewController: UIViewController, GADFullScreenContentDelegate {
    
    var viewSelf: StartView! {
        guard isViewLoaded else {return nil}
        return (view as! StartView)
    }
    
    var listGame = [String]()
    var currentIndex = 0
    var AdUnitID: String!
    var rewardedAd: GADRewardedAd?
    let valuePeriodWithooutADVInSeconds = 10800 /// 3 часа - 10800

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
    }
    
    ///
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewSelf.contentGameCollection.reloadData()
    }
    
    ///
    func createListGame() {
        listGame = ["fruit_", "emoji_", "animal_", "dinosaur_", "monster_"]
    }
    
    ///
    func setBlocked(key: String) -> Bool {
        let dateSee: Date? = UserDefaults.standard.object(forKey: key) as? Date
        
        print(">>>>> \(key): \(dateSee)")
        
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
