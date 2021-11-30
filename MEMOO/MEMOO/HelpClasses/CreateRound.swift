import UIKit

class CreateRound {
    
    ///
    class func create(nameRound: String, freeListRound: [String], completion: (Round) -> ()) {
        let idRound = parseID(name: nameRound)
        let isRoundBuy = freeListRound.contains(nameRound) ? true : UserDefaults.standard.bool(forKey: "\(idRound)_buy")
        print("\(nameRound) --- \(isRoundBuy)")
        let state: RoundState = isRoundBuy == true ? .buy : .notBuy
        let round = Round(idRound: idRound, name: nameRound, state: state)
        completion(round)
    }
    
    ///
    class func parseID(name: String) -> String {
        switch name {
        case "alfred":
            return ProductIDs.unlockalfredID.rawValue
        case "animall":
            return ProductIDs.unlockanimallID.rawValue
        case "mandala":
            return ProductIDs.unlockmandalaID.rawValue
        case "ninja":
            return ProductIDs.unlockninjaID.rawValue
        case "sport":
            return ProductIDs.unlocksportID.rawValue
        case "summer":
            return ProductIDs.unlocksummerID.rawValue
        case "toy":
            return ProductIDs.unlocktoyID.rawValue
        case "dog":
            return ProductIDs.unlockdogID.rawValue
        case "toyy":
            return ProductIDs.unlocktoyyID.rawValue
        case "vegetable":
            return ProductIDs.unlockvegetableID.rawValue
        case "space":
            return ProductIDs.unlockspaceID.rawValue
        case "letter":
            return ProductIDs.unlockletterID.rawValue
        case "origami":
            return ProductIDs.unlockorigamiID.rawValue
        case "animalll":
            return ProductIDs.unlockanimalllID.rawValue
        case "flower":
            return ProductIDs.unlockflowerID.rawValue
        case "fauna":
            return ProductIDs.unlockfauna.rawValue
        default:
            return "id"
        }
    }
}
