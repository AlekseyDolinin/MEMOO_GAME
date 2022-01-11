import UIKit

struct Round {
    
    var idRound: String
    var name: String
    var roundFree: Bool
    var roundBuy: Bool
    var countErrors: Int
    
    init(idRound: String,
         name: String,
         roundFree: Bool,
         roundBuy: Bool,
         countErrors: Int = 0
    ){
        self.idRound = idRound
        self.name = name
        self.roundFree = roundFree
        self.roundBuy = roundBuy
        self.countErrors = countErrors
    }
}
