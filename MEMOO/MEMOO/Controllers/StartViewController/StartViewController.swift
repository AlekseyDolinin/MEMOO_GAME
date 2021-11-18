import UIKit
import GoogleMobileAds

class StartViewController: UIViewController, GADFullScreenContentDelegate {
    
    var viewSelf: StartView! {
        guard isViewLoaded else {return nil}
        return (view as! StartView)
    }

    static var nameGame: String!
    static var unlockAllGame: Bool!
    
    var lastContentOffset: CGFloat = 0
    var listGame = ["fruit_", "animal_", "alfred_", "animall_", "mandala_", "ninja_",  "sport_", "summer_", "toy_", "dog_", "toyy_", "vegetable_", "space_", "letter_", "origami_", "animalll_", "farm_", "flower_", "fauna_", "flag_"]
    var currentIndex = 0
    var rewardedAd: GADRewardedAd?
    let valuePeriodWithooutADVInSeconds = 50 /// 3 часа - 10800
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        viewSelf.collectionRound.delegate = self
        viewSelf.collectionRound.dataSource = self
        self.gadRequest()
    }
    
    ///
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        viewSelf.collectionRound.reloadData()
        chekLockedGame()
    }
    
    ///
    func chekLockedGame() {
//        let listGameAdv = ["animal_", "dinosaur_", "monster_"]
//        for nameGame in listGameAdv {
//            let dateSeeADV: Date? = UserDefaults.standard.object(forKey: nameGame + "date") as? Date
//            print(">>>>>>>>>>>>\(nameGame) - \(String(describing: dateSeeADV))")
//            if dateSeeADV != nil {
//                /// проверка как давно был просмотр рекламы
//                let secondsCount = Int(Date().timeIntervalSince1970 - dateSeeADV!.timeIntervalSince1970)
//                print(secondsCount)
//                if secondsCount >= valuePeriodWithooutADVInSeconds {
//                    UserDefaults.standard.set(nil, forKey: nameGame + "date")
//                }
//            }
//        }
    }
    
    ///
    func openGame() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}
