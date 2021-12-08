import UIKit
import GoogleMobileAds

extension GameMenuViewController {
    
    ///
    func gadRequest() {
        let request = GADRequest()
        var AdUnitID: String!
        
        #if DEBUG
        AdUnitID = "ca-app-pub-3940256099942544/1712485313"
        #else
        AdUnitID = "ca-app-pub-8093774413708674/3028809513"
        #endif

//        AdUnitID = "ca-app-pub-8093774413708674/3028809513"
        
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
            ad.present(fromRootViewController: self) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                    self.reloadRound()
                }
            }
        } else {
            print("Ad wasn't ready")
            reloadRound()
        }
    }
}


extension GameMenuViewController {
    func adWillDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        self.gadRequest()
        print("реклама не досмотрена _ 1")
    }
}
