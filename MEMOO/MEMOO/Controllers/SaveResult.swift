import Foundation

class SaveResult: NSObject {
    
    /// проверка достижений игры
    class func checkStateRound() {
        print("countErrors: \(StartViewController.selectRound.countErrors)")
        
        
        
        
        
        
        
        
        
    }
    
    /// запись результата игры
    func save(idArtefact: Int) {
        print("SaveResult")
        
        /// пройден первый раунд
        if idArtefact == 1 {
            UserDefaults.standard.set(true, forKey: "artefact_1")
        } else {
            let oldValue: Int = UserDefaults.standard.integer(forKey: "artefact_\(idArtefact)")
            UserDefaults.standard.set(oldValue + 1, forKey: "artefact_\(idArtefact)")
        }
    }
}
