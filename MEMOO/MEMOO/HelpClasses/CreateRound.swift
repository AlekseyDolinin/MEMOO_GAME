import UIKit

class CreateRound {
    
    ///
    class func createFreeRound(namesRound: [String], completion: ([Round]) -> ()) {
        var temp = [Round]()
        for nameRound in namesRound {
            let round = (Round(idRound: parseID(name: nameRound), name: nameRound, roundFree: true, roundBuy: false))
            temp.append(round)
        }
        if temp.count == namesRound.count {
            completion(temp)
        }
    }
    
    ///
    class func createNotFreeRound(namesRound: [String], completion: ([Round]) -> ()) {
        var temp = [Round]()
        var roundBuy = false
        if StoreManager.isUnlockAllContent() == true {
            roundBuy = true
        }
        
        for nameRound in namesRound {
            if UserDefaults.standard.bool(forKey: "\(parseID(name: nameRound))_buy") == true {
                roundBuy = true
            }
            let round = (Round(idRound: parseID(name: nameRound), name: nameRound, roundFree: false, roundBuy: roundBuy))
            temp.append(round)
            
            print(parseID(name: nameRound))
            print(nameRound)
            print("_______")
        }
        if temp.count == namesRound.count {
            completion(temp)
        }
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
