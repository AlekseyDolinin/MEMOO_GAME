import UIKit
import GoogleMobileAds

class StartViewController: UIViewController, GADFullScreenContentDelegate {
    
    var viewSelf: StartView! {
        guard isViewLoaded else {return nil}
        return (view as! StartView)
    }

    static var nameGame: String!
    
    var listGame = ["fruit_", "emoji_", "animal_", "dinosaur_", "monster_"]
    var currentIndex = 0
    var rewardedAd: GADRewardedAd?
    let valuePeriodWithooutADVInSeconds = 50 /// 3 часа - 10800

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
        self.chekLockedGame()
    }
    
    ///
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        viewSelf.contentGameCollection.reloadData()
        chekLockedGame()
    }
    
    ///
    func chekLockedGame() {
        let listGameAdv = ["animal_", "dinosaur_", "monster_"]
        for nameGame in listGameAdv {
            let dateSeeADV: Date? = UserDefaults.standard.object(forKey: nameGame + "date") as? Date
            print(">>>>>>>>>>>>\(nameGame) - \(String(describing: dateSeeADV))")
            if dateSeeADV != nil {
                /// проверка как давно был просмотр рекламы
                let secondsCount = Int(Date().timeIntervalSince1970 - dateSeeADV!.timeIntervalSince1970)
                print(secondsCount)
                if secondsCount >= valuePeriodWithooutADVInSeconds {
                    UserDefaults.standard.set(nil, forKey: nameGame + "date")
                }
            }
        }
    }
    
    ///
    func openGame() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}
