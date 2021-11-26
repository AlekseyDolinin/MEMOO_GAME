import UIKit

struct Round {
    var name: String
    var status: RoundStatus
    var state: RoundState
    
    init(name: String,
         status: RoundStatus,
         state: RoundState = .notBuy
    ){
        self.name = name
        self.status = status
        self.state = state
    }
}



enum RoundStatus {
    case free
    case notFree
}

enum RoundState {
    case buy
    case notBuy
}
