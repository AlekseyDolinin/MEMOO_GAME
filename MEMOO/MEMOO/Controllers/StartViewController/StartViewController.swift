import UIKit

class StartViewController: UIViewController {
    
    var viewSelf: StartView! {
        guard isViewLoaded else {return nil}
        return (view as! StartView)
    }

    static var selectRound: Round!
    
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
        let productIDs = Set<String>(ProductIDs.allCases.map { $0.rawValue })
        priceManager.getPricesForInApps(inAppsIDs: productIDs)
        
        ///
        self.createRoundes(nameList: freeListRound)
        
        ///
        NotificationCenter.default.addObserver(forName: nPricesUpdated, object: nil, queue: nil) { notification in
            print("Обновление цен")
            self.createRoundes(nameList: self.paidListRound)
        }
        
        ///
        NotificationCenter.default.addObserver(forName: nTransactionComplate, object: nil, queue: nil) { notification in
            DispatchQueue.main.async {
                self.viewSelf.collectionRound.reloadData()
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
    func createRoundes(nameList: [String]) {
        for name in nameList {
            CreateRound.create(nameRound: name, freeListRound: freeListRound) { round in
                listRounds.append(round)
            }
        }
        DispatchQueue.main.async {
            self.viewSelf.collectionRound.reloadData()
        }
    }
    
    ///
    func openGame() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
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
        vc.selectRound = StartViewController.selectRound
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    @IBAction func showMenu(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: false)
    }
}
