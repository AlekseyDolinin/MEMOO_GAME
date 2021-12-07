import UIKit
import GoogleMobileAds

class StartViewController: UIViewController, GADFullScreenContentDelegate {
    
    var viewSelf: StartView! {
        guard isViewLoaded else {return nil}
        return (view as! StartView)
    }

    static var selectRound: Round!
    static var haveBuyContent = false
    
    ///  смещение колекции (для паралакса)
    var lastContentOffset: CGFloat = 0
    var freeListRound = ["fruit", "flag", "farm", "animal"]
    var paidListRound = ["alfred", "animall", "mandala", "ninja", "sport", "summer", "toy", "dog", "toyy", "vegetable", "space", "letter", "origami", "animalll", "flower", "fauna"]
    var listRounds = [Round]()
    let priceManager = PriceManager()
    var rewardedAd: GADRewardedAd?
    
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        viewSelf.collectionRound.delegate = self
        viewSelf.collectionRound.dataSource = self
        
        ///
        self.gadRequest()
        
        /// получение цен покупок
        getPriceProducts()
        
        ///
        CreateRound.createFreeRound(namesRound: freeListRound) { round in
            listRounds.append(round)
            checkHaveBuyContent()
            viewSelf.collectionRound.reloadData()
        }
        
        ///
        NotificationCenter.default.addObserver(forName: nPricesUpdated, object: nil, queue: nil) { notification in
            print("Обновление цен")
            CreateRound.createNotFreeRound(namesRound: self.paidListRound) { round in
                self.listRounds.append(round)
                self.checkHaveBuyContent()
                DispatchQueue.main.async {
                    self.viewSelf.collectionRound.reloadData()
                }
            }
        }
        
        ///
        NotificationCenter.default.addObserver(forName: nTransactionComplate, object: nil, queue: nil) { notification in
            self.dismiss(animated: true)
            self.listRounds.removeAll()
            ///
            CreateRound.createFreeRound(namesRound: self.freeListRound) { round in
                self.listRounds.append(round)
                CreateRound.createNotFreeRound(namesRound: self.paidListRound) { round in
                    self.listRounds.append(round)
                    self.checkHaveBuyContent()
                    self.viewSelf.collectionRound.reloadData()
                }
            }
        }
    }
    
    ///
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let widthCell = view.frame.width - 140
        let leftInset = (view.frame.width - widthCell) / 3
        viewSelf.collectionRound.contentInset = UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: leftInset)
    }
    
    ///
    func getPriceProducts() {
        /// получение цен покупок
        let productIDs = Set<String>(ProductIDs.allCases.map { $0.rawValue })
        priceManager.getPricesForInApps(inAppsIDs: productIDs)
    }
    
//    ///
//    func createRoundes(nameList: [String]) {
//        for name in nameList {
//            /// бесплатный раунд
//            if freeListRound.contains(name) {
//                CreateRound.createFreeRound(nameRound: name) { round in
//                    listRounds.append(round)
//                }
//            } else {
//                CreateRound.createNotFreeRound(nameRound: name) { round in
//                    listRounds.append(round)
//                }
//            }
//        }
//        DispatchQueue.main.async {
//            self.checkHaveBuyContent()
//            self.viewSelf.collectionRound.reloadData()
//        }
//    }
    
    /// проверка есть ли купленый контент
    func checkHaveBuyContent() {
        /// куплена полная версия
        if StoreManager.isUnlockAllContent() == true {
            StartViewController.haveBuyContent = true
        } else {
            print("полная версия не куплена, проверка есть ли купленый раунд")
            /// проход по платным раундам
            for round in listRounds {
                if round.roundFree == false && round.roundBuy == true {
                    print("есть купленый контент")
                    StartViewController.haveBuyContent = true
                }
            }
        }
    }
    
    ///
    func checkRound() {
        
        if StartViewController.selectRound.roundFree {
            StartViewController.haveBuyContent ? openRound() : showADS()
        } else {
            StartViewController.selectRound.roundBuy ? openRound() : openModalLockedRound()
        }
        
        
//        /// выбран бесплатный раунд
//        if (0...3).contains(index) {
//            StartViewController.haveBuyContent == true ? openRound() : showADS()
//        } else {
//            /// выбран платный раунд
//            /// проверка куплен ли весь контент?
//            if StoreManager.isUnlockAllContent() {
//                openRound()
//            } else {
//                /// проверка куплен ли выбраный раунд
//                StartViewController.selectRound.state == .buy ? openRound() : openModalLockedRound()
//            }
//        }
    }
    
    ///
    func openRound() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }
    
    ///
    func openModalLockedRound() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ModalLockedRoundViewController") as! ModalLockedRoundViewController
        vc.round = StartViewController.selectRound
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    ///
    @IBAction func openArtefactCollection() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ArtefactViewController") as! ArtefactViewController
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    ///
    @IBAction func showMenu(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: false)
    }
}
