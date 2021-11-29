import UIKit

class CreateNotFreeRound {
    
    class func create(paidListRound: [String], completion: (Round) -> ()) {
        for name in paidListRound {
            /// здесь проверять в дефолте покупку раунда
            let state: RoundState = .notBuy
            let round = Round(idRound: "id", name: name, state: state)
            completion(round)
        }

    }
}
