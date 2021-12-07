import UIKit

struct Round {
    
    var idRound: String
    var name: String
    var roundFree: Bool
    var roundBuy: Bool
    
    init(idRound: String,
         name: String,
         roundFree: Bool,
         roundBuy: Bool
    ){
        self.idRound = idRound
        self.name = name
        self.roundFree = roundFree
        self.roundBuy = roundBuy
    }
}
