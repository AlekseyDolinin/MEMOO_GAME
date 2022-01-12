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
        
        
        /// пройден раунд с 10 ошибками
        if (8...10).contains(round.countErrors) {
            let oldValue = UserDefaults.standard.integer(forKey: "10_Error")
            UserDefaults.standard.set(oldValue + 1, forKey: "10_Errors")
        }
        
        
        /// пройден раунд с 7 ошибками
        if (4...7).contains(round.countErrors) {
            let oldValue = UserDefaults.standard.integer(forKey: "7_Error")
            UserDefaults.standard.set(oldValue + 1, forKey: "7_Errors")
        }
        
        
        /// пройден раунд с 3 ошибками
        if (1...3).contains(round.countErrors) {
            let oldValue = UserDefaults.standard.integer(forKey: "3_Error")
            UserDefaults.standard.set(oldValue + 1, forKey: "3_Errors")
        }
        
        
        /// пройден раунд без ошибок
        if round.countErrors == 0 {
            let oldValue = UserDefaults.standard.integer(forKey: "NoError")
            UserDefaults.standard.set(oldValue + 1, forKey: "NoErrors")
        }
        
        
        /// сыграно всего раундов
        let countAllRounds = UserDefaults.standard.integer(forKey: "CountAllRounds")
        UserDefaults.standard.set(countAllRounds + 1, forKey: "CountAllRounds")
        print("сыграно всего раундов: \(UserDefaults.standard.integer(forKey: "CountAllRounds"))")
        

                
        
        /// сыграно всего раундов за день

        

        
        
        
        
        /// Пройден раунд менее чем за 15 секунд
        print("время прохождения раунда: \(TimerRound.countSecondToRound) секунд")
        if TimerRound.countSecondToRound < 15 {
            let oldValue = UserDefaults.standard.integer(forKey: "Less15Seconds")
            UserDefaults.standard.set(oldValue + 1, forKey: "Less15Seconds")
        }
        
        
        /// сыграно раундов
        switch UserDefaults.standard.integer(forKey: "CountAllRounds") {
        case 50:
            UserDefaults.standard.set(true, forKey: "50RoundsDone")
        case 100:
            UserDefaults.standard.set(true, forKey: "100RoundsDone")
        case 200:
            UserDefaults.standard.set(true, forKey: "200RoundsDone")
        case 300:
            UserDefaults.standard.set(true, forKey: "300RoundsDone")
        case 500:
            UserDefaults.standard.set(true, forKey: "500RoundsDone")
        case 1000:
            UserDefaults.standard.set(true, forKey: "1000RoundsDone")
        default:
            break
        }

            
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
        
        
        /// пройден уровень Alfred
        if round.name == "alfred" {
            let oldValue = UserDefaults.standard.integer(forKey: "CountAlfredRound")
            UserDefaults.standard.set(oldValue + 1, forKey: "CountAlfredRound")
        }
        
        /// пройден уровень zoo
        if round.name == "zoo" {
            let oldValue = UserDefaults.standard.integer(forKey: "CountZooRound")
            UserDefaults.standard.set(oldValue + 1, forKey: "CountZooRound")
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
        
        
        /// пройден уровень Карапуз
        if round.name == "toddler" {
            let oldValue = UserDefaults.standard.integer(forKey: "CountToddlerRound")
            UserDefaults.standard.set(oldValue + 1, forKey: "CountToddlerRound")
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
        if round.name == "letter" {
            let oldValue = UserDefaults.standard.integer(forKey: "CountLetterRound")
            UserDefaults.standard.set(oldValue + 1, forKey: "CountLetterRound")
        }
        
        
        /// пройден уровень оригами
        if round.name == "origami" {
            let oldValue = UserDefaults.standard.integer(forKey: "CountOrigamiRound")
            UserDefaults.standard.set(oldValue + 1, forKey: "CountOrigamiRound")
        }
        
        
        /// пройден уровень милота
        if round.name == "сute" {
            let oldValue = UserDefaults.standard.integer(forKey: "CountСuteRound")
            UserDefaults.standard.set(oldValue + 1, forKey: "CountСuteRound")
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
