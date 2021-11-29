import UIKit

class CreateRound {
    
    ///
    class func create(nameRound: String, freeListRound: [String], completion: (Round) -> ()) {
        let isRoundBuy = freeListRound.contains(nameRound) ? true : UserDefaults.standard.bool(forKey: parseID(name: nameRound))
        let state: RoundState = isRoundBuy == true ? .buy : .notBuy
        let round = Round(idRound: parseID(name: nameRound), name: nameRound, state: state)
        completion(round)
    }
    
    ///
    class func parseID(name: String) -> String {
        switch name {
        case "alfred":
            return "unlockAlfredID"
        case "animall":
            return "unlockAnimallID"
        case "mandala":
            return "unlockMandalaID"
        case "ninja":
            return "unlockNinjaID"
        case "sport":
            return "unlockSportID"
        case "summer":
            return "unlockSummerID"
        case "toy":
            return "unlockToyID"
        case "dog":
            return "unlockDogID"
        case "toyy":
            return "unlockToyyID"
        case "vegetable":
            return "unlockVegetableID"
        case "space":
            return "unlockSpaceID"
        case "letter":
            return "unlockLetterID"
        case "origami":
            return "unlockOrigamiID"
        case "animalll":
            return "unlockAnimalllID"
        case "flower":
            return "unlockFlowerID"
        case "fauna":
            return "unlockFaunaID"
        default:
            return "id"
        }
    }
}
