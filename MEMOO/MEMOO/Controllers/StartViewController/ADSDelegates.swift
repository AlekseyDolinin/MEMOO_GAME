import UIKit
import GoogleMobileAds

extension StartViewController {
    
    ///
    func showADS() {
        if GADRewardBasedVideoAd.sharedInstance().isReady {
            GADRewardBasedVideoAd.sharedInstance().present(fromRootViewController: self)
        }
    }
    
    ///
    func rewardBasedVideoAdDidClose(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("просмотрена реклама для \(listGame[currentIndex].name)")
        listGame[currentIndex].blocked = false
        viewSelf.contentGameCollection.reloadData()
        
        GADRewardBasedVideoAd.sharedInstance().load(GADRequest(), withAdUnitID: AdUnitID)
        
        switch listGame[currentIndex].name {
        case "animal_", "dinosaur_", "monster_":
            UserDefaults.standard.set(Date(), forKey: listGame[currentIndex].name)
        default:
            break
        }
    }
    
    ///
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd, didRewardUserWith reward: GADAdReward) {
        print(reward.type)
        print(reward.amount)
    }
}
