import UIKit

struct Round {
    var idRound: String?
    var name: String
    var state: RoundState
    
    init(idRound: String? = "",
         name: String,
         state: RoundState = .notBuy
    ){
        self.idRound = idRound
        self.name = name
        self.state = state
    }
}

enum RoundState {
    case buy
    case notBuy
}
