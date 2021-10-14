import UIKit
import GoogleMobileAds

extension StartViewController {
    
    ///
    func gadRequest() {
        let request = GADRequest()
        var AdUnitID: String!
        
//        #if DEBUG
//        AdUnitID = "ca-app-pub-3940256099942544/1712485313"
//        #else
//        AdUnitID = "ca-app-pub-8093774413708674/3028809513"
//        #endif
        
        AdUnitID = "ca-app-pub-3940256099942544/1712485313"
        
        GADRewardedAd.load(withAdUnitID: AdUnitID, request: request, completionHandler: { (ad, error) in
            if let error = error {
                print("Rewarded ad failed to load with error: \(error.localizedDescription)")
                return
            }
            self.rewardedAd = ad
            self.rewardedAd?.fullScreenContentDelegate = self
        })
    }
    
    ///
    func showADS() {
        
        if let ad = rewardedAd {
            ad.present(fromRootViewController: self, userDidEarnRewardHandler: {
                print("просмотрена реклама для \(self.listGame[self.currentIndex])")
//                self.listGame[self.currentIndex].blocked = false
//                self.viewSelf.contentGameCollection.reloadData()
                
//                self.gadRequest()
                
//                UserDefaults.standard.set(Date(), forKey: self.listGame[self.currentIndex].name + "_ad")
                
//                switch self.listGame[self.currentIndex].name {
//                case "animal_", "dinosaur_", "monster_":
//                    UserDefaults.standard.set(Date(), forKey: self.listGame[self.currentIndex].name)
//                default:
//                    break
//                }
                
            })
        } else {
            print("Ad wasn't ready")
        }
    }
}
