import UIKit

class StartViewController: UIViewController {
    
    var viewSelf: StartView! {
        guard isViewLoaded else {return nil}
        return (view as! StartView)
    }

    static var selectRound: Round!
    
    ///  смещение колекции (для паралакса)
    var lastContentOffset: CGFloat = 0
    var freeListRound = ["fruit_", "flag_", "farm_", "animal_"]
    var paidListRound = ["alfred_", "animall_", "mandala_", "ninja_", "sport_", "summer_", "toy_", "dog_", "toyy_", "vegetable_", "space_", "letter_", "origami_", "animalll_", "flower_", "fauna_"]
    
    var listRounds = [Round]()
    
    let priceManager = PriceManager()
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        viewSelf.collectionRound.delegate = self
        viewSelf.collectionRound.dataSource = self
        
        /// получение цен покупок
        priceManager.getPricesForInApps(inAppsIDs: Set<String>(self.paidListRound + ["unlockAllContentID"]))
        
        ///
        NotificationCenter.default.addObserver(forName: nPricesUpdated, object: nil, queue: nil) { notification in
            print("Обновление цен")
//            var priceAllContent = UserDefaults.standard.object(forKey: "unlockAllContentID")
//            var priceAlfred = UserDefaults.standard.object(forKey: "alfred_")
            self.createRoundes()
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
    func createRoundes() {
        let allRounds = freeListRound + paidListRound
        for (index, value) in allRounds.enumerated() {
            var status: RoundStatus!
            if (0...3).contains(index) {
                status = .free
            } else {
                status = .lock
            }
            listRounds.append(Round(name: value, status: status))
        }
        if listRounds.count == (freeListRound + paidListRound).count {
            DispatchQueue.main.async {
                self.viewSelf.collectionRound.reloadData()
            }
        }
    }
    
    
    ///
    func openGame() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true) {
            
        }
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    ///
    func openModalLockedRound() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ModalLockedRoundViewController") as! ModalLockedRoundViewController
        vc.selectRound = StartViewController.selectRound
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
}
