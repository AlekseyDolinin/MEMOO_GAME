import UIKit
import GoogleMobileAds

class StartViewController: UIViewController, GADFullScreenContentDelegate {
    
    var viewSelf: StartView! {
        guard isViewLoaded else {return nil}
        return (view as! StartView)
    }

    static var nameGame: String!
    static var unlockAllGame: Bool!
    
    var listGame = ["fruit_", "emoji_", "animal_", "dinosaur_", "monster_", "alfred_", "animall_", "mandala_", "ninja_",  "sport_", "summer_", "toy_", "word_", "wordd_", "dog_", "toyy_", "vegetable_", "space_", "letter_", "origami_", "letterr_", "animalll_", "farm_", "flower_", "fauna_", "flag_"]
    var currentIndex = 0
    var rewardedAd: GADRewardedAd?
    let valuePeriodWithooutADVInSeconds = 50 /// 3 часа - 10800
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        viewSelf.contentGameCollection.delegate = self
        viewSelf.contentGameCollection.dataSource = self
        self.gadRequest()
    }
    
    ///
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        viewSelf.contentGameCollection.reloadData()
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
