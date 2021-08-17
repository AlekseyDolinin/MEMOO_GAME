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
        print("rewardBasedVideoAdDidClose")
        print("GADRequest")
        print("просмотрена реклама для \(listGame[currentIndex].name)")
        listGame[currentIndex].blocked = false
        viewSelf.contentGameCollection.reloadData()
        
        GADRewardBasedVideoAd.sharedInstance().load(GADRequest(), withAdUnitID: AdUnitID)
        
        switch listGame[currentIndex].name {
        case "dinosaur_":
            UserDefaults.standard.set(Date(), forKey: "dateSeeADSDinosaur")
            
        case "monster_":
            UserDefaults.standard.set(Date(), forKey: "dateSeeADSMonster")
            
        default:
            break
        }
    }
    
    ///
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd, didRewardUserWith reward: GADAdReward) {
        print(reward.type)
        print(reward.amount)
    }
    
    
    
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd, didFailToLoadWithError error: Error) {
        //        print("rewardBasedVideoAd")
    }
    func rewardBasedVideoAdDidOpen(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        //        print("rewardBasedVideoAdDidOpen")
    }
    func rewardBasedVideoAdDidReceive(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        //        print("rewardBasedVideoAdDidReceive")
    }
    func rewardBasedVideoAdDidStartPlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        //        print("rewardBasedVideoAdDidStartPlaying")
    }
    func rewardBasedVideoAdMetadataDidChange(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        //        print("rewardBasedVideoAdMetadataDidChange")
    }
    func rewardBasedVideoAdDidCompletePlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        //        print("rewardBasedVideoAdDidCompletePlaying")
    }
    func rewardBasedVideoAdWillLeaveApplication(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        //        print("rewardBasedVideoAdWillLeaveApplication")
    }
}
