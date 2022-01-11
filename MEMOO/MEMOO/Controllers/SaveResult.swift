import Foundation

class SaveResult: NSObject {
    
    /// проверка достижений игры
    class func checkStateRound() {
                
        guard let round = StartViewController.selectRound else {
            print("ERROR StartViewController.selectRound == NIL")
            return
        }
        
        print("countErrors: \(round.countErrors)")
        
        /// пройден первый раунд
        UserDefaults.standard.set(true, forKey: "FirstRoundDone")
        
        /// сыграно всего раундов
        let countAllRounds = UserDefaults.standard.integer(forKey: "CountAllRounds")
        UserDefaults.standard.set(countAllRounds + 1, forKey: "CountAllRounds")
        
        /// сыграно всего раундов за день
        let countRoundsPerDay = UserDefaults.standard.integer(forKey: "CountAllRoundsPerDay")
        UserDefaults.standard.set(countRoundsPerDay + 1, forKey: "CountAllRoundsPerDay")
        
        
        
        
        
        
        
        
        
        /// пройден раунд с ошибками 3..7
        if (4...7).contains(round.countErrors) {
            UserDefaults.standard.set(true, forKey: "artefact_2")
        }
        
        /// пройден раунд с ошибками 1..3
        if (1...3).contains(round.countErrors) {
            UserDefaults.standard.set(true, forKey: "artefact_3")
        }
        
        /// пройден раунд без ошибок
        if round.countErrors == 0 {
            UserDefaults.standard.set(true, forKey: "artefact_4")
        }
        
        
        
        
        /// раундов за день 50
        
        /// раундов за день 100
        
        /// подряд 3 раунда
        
        /// подряд 5 раундов
        
        /// подряд 7 раундов
        
        /// подряд 10 раундов
        
        /// пройден раунд менее чем за 15 сек
        
        /// сыграно 300 раундов
        
        /// сыграно 200 раундов
        
        /// пройдены все уровни с животными
        
        /// сыграно 100 раундов
        
        /// сыграно 500 раундов
        
        /// ...
        
        /// ...
        
        /// ...
        
        /// ...
        
        /// ...
        
        /// пройден уровень фрукты
        if round.name == "fruit" {
            let oldValue = UserDefaults.standard.integer(forKey: "CountFruitRound")
            UserDefaults.standard.set(oldValue + 1, forKey: "CountFruitRound")
        }
        
        /// пройден уровень флаги
        if round.name == "flag" {
            let oldValue = UserDefaults.standard.integer(forKey: "CountFlagRound")
            UserDefaults.standard.set(oldValue + 1, forKey: "CountFlagRound")
        }
        
        /// пройден уровень ферма
        if round.name == "farm" {
            let oldValue = UserDefaults.standard.integer(forKey: "CountFarmRound")
            UserDefaults.standard.set(oldValue + 1, forKey: "CountFarmRound")
        }
        
        /// пройден уровень животные
        if round.name == "animal" {
            let oldValue = UserDefaults.standard.integer(forKey: "CountAnimalsRound")
            UserDefaults.standard.set(oldValue + 1, forKey: "CountAnimalsRound")
        }
        
        /// пройден уровень динозавр
        if round.name == "alfred" {
            let oldValue = UserDefaults.standard.integer(forKey: "CountAlfredRound")
            UserDefaults.standard.set(oldValue + 1, forKey: "CountAlfredRound")
        }
        
        /// пройден уровень animall
        if round.idRound == "animall" {
            let oldValue = UserDefaults.standard.integer(forKey: "CountAnimallRound")
            UserDefaults.standard.set(oldValue + 1, forKey: "CountAnimallRound")
        }
        
        /// пройден уровень узоры
        if round.name == "mandala" {
            let oldValue = UserDefaults.standard.integer(forKey: "CountMandalaRound")
            UserDefaults.standard.set(oldValue + 1, forKey: "CountMandalaRound")
        }
        
        /// пройден уровень ниндзя
        if round.name == "ninja" {
            let oldValue = UserDefaults.standard.integer(forKey: "CountNinjaRound")
            UserDefaults.standard.set(oldValue + 1, forKey: "CountNinjaRound")
        }
        
        /// пройден уровень спорт
        if round.name == "sport" {
            let oldValue = UserDefaults.standard.integer(forKey: "CountSportRound")
            UserDefaults.standard.set(oldValue + 1, forKey: "CountSportRound")
        }
        
        /// пройден уровень лето
        if round.name == "summer" {
            let oldValue = UserDefaults.standard.integer(forKey: "CountSummerRound")
            UserDefaults.standard.set(oldValue + 1, forKey: "CountSummerRound")
        }
        
        /// пройден уровень игрушки
        if round.name == "toy" {
            let oldValue = UserDefaults.standard.integer(forKey: "CountToyRound")
            UserDefaults.standard.set(oldValue + 1, forKey: "CountToyRound")
        }
        
        /// пройден уровень собаки
        if round.name == "dog" {
            let oldValue = UserDefaults.standard.integer(forKey: "CountDogRound")
            UserDefaults.standard.set(oldValue + 1, forKey: "CountDogRound")
        }
        
        /// пройден уровень toyy
        if round.idRound == "toyy" {
            let oldValue = UserDefaults.standard.integer(forKey: "CountToyyRound")
            UserDefaults.standard.set(oldValue + 1, forKey: "CountToyyRound")
        }
        
        /// пройден уровень овощи
        if round.name == "vegetable" {
            let oldValue = UserDefaults.standard.integer(forKey: "CountVegetableRound")
            UserDefaults.standard.set(oldValue + 1, forKey: "CountVegetableRound")
        }
        
        /// пройден уровень космос
        if round.name == "space" {
            let oldValue = UserDefaults.standard.integer(forKey: "CountSpaceRound")
            UserDefaults.standard.set(oldValue + 1, forKey: "CountSpaceRound")
        }
        
        /// пройден уровень буквы
        if round.idRound == "letter" {
            let oldValue = UserDefaults.standard.integer(forKey: "CountLetterRound")
            UserDefaults.standard.set(oldValue + 1, forKey: "CountLetterRound")
        }
        
        /// пройден уровень оригами
        if round.name == "origami" {
            let oldValue = UserDefaults.standard.integer(forKey: "CountOrigamiRound")
            UserDefaults.standard.set(oldValue + 1, forKey: "CountOrigamiRound")
        }
        
        /// пройден уровень animalll
        if round.name == "animalll" {
            let oldValue = UserDefaults.standard.integer(forKey: "CountAnimalllRound")
            UserDefaults.standard.set(oldValue + 1, forKey: "CountAnimalllRound")
        }
        
        /// пройден уровень цветы
        if round.name == "flower" {
            let oldValue = UserDefaults.standard.integer(forKey: "CountFlowerRound")
            UserDefaults.standard.set(oldValue + 1, forKey: "CountFlowerRound")
        }
        
        /// пройден уровень fauna
        if round.name == "fauna" {
            let oldValue = UserDefaults.standard.integer(forKey: "CountFaunaRound")
            UserDefaults.standard.set(oldValue + 1, forKey: "CountFaunaRound")
        }
    }
}
