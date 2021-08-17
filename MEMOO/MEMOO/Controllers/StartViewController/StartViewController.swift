import UIKit
import GoogleMobileAds

class StartViewController: UIViewController, GADRewardBasedVideoAdDelegate {
    
    var viewSelf: StartView! {
        guard isViewLoaded else {return nil}
        return (view as! StartView)
    }
    
    var listGame: [(name: String, blocked: Bool)] = [(name: "fruit_", blocked: false),
                                                     (name: "emoji_", blocked: false),
                                                     (name: "animal_", blocked: false),
                                                     (name: "dinosaur_", blocked: true),
                                                     (name: "monster_", blocked: true)]
    var currentIndex = 0
    var AdUnitID: String!
    
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
}
