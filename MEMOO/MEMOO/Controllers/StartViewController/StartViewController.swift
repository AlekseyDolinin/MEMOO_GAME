import UIKit

class StartViewController: UIViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        viewSelf.collectionRound.delegate = self
        viewSelf.collectionRound.dataSource = self
        
        /// получение цен покупок
        getPriceProducts()
        
        ///
        CreateRound.createFreeRound(namesRound: self.freeListRound) { rounds in
            self.listRounds = []
            self.listRounds = self.listRounds + rounds
            CreateRound.createNotFreeRound(namesRound: self.paidListRound) { rounds in
                self.listRounds = self.listRounds + rounds
                DispatchQueue.main.async {
                    self.viewSelf.collectionRound.reloadData()
                }
            }
        }
        
        ///
        NotificationCenter.default.addObserver(forName: nTransactionComplate, object: nil, queue: nil) { notification in
            print("nTransactionComplate")
            self.dismiss(animated: true)
            ///
            CreateRound.createFreeRound(namesRound: self.freeListRound) { rounds in
                self.listRounds = []
                self.listRounds = self.listRounds + rounds
                CreateRound.createNotFreeRound(namesRound: self.paidListRound) { rounds in
                    self.listRounds = self.listRounds + rounds
                    DispatchQueue.main.async {
                        self.viewSelf.collectionRound.reloadData()
                    }
                }
            }
        }
        
        self.checkHaveBuyContent()
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
            openRound()
        } else {
            StartViewController.selectRound.roundBuy ? openRound() : openModalLockedRound()
        }
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
