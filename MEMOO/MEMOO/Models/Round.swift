import UIKit

struct Round {
    var name: String
    var status: RoundStatus
    
    init(name: String,
         status: RoundStatus
    ){
        self.name = name
        self.status = status
    }
}



enum RoundStatus {
    case free
    case lock
    case buy
}
