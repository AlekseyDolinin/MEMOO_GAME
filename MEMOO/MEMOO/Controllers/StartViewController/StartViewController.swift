import UIKit

class StartViewController: UIViewController {
    
    var viewSelf: StartView! {
        guard isViewLoaded else {return nil}
        return (view as! StartView)
    }

    static var nameGame: String!
    
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
        priceManager.getPricesForInApps(inAppsIDs: Set<String>(self.paidListRound))
        priceManager.getPricesForInApps(inAppsIDs: Set<String>(["unlockAllContentID"]))
        
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

    }
    
    ///
    func createRoundes() {
        for (index, value) in (freeListRound + paidListRound).enumerated() {
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
        navigationController?.pushViewController(vc, animated: true)
    }
    
    ///
    func openModalLockedRound() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ModalLockedRoundViewController") as! ModalLockedRoundViewController
        vc.modalPresentationStyle = .pageSheet
        present(vc, animated: true)
    }
}
