import Foundation

extension ArtefactCell {
    ///
    func setCount() {
        
        ///
        ///  --------------------------------
        
        
        /// пройден первый раунд
        if artefact.nameArtefact == "Ka-mua" {
            if UserDefaults.standard.bool(forKey: "FirstRoundDone") == true {
                countBack.isHidden = false
                countLabel.text = "✓"
                artefactImage.image = artefact.image
            } else {
                countBack.isHidden = true
                artefactImage.image = artefact.image.noir
            }
        }
        
        
        ///
        ///  --------------------------------
        
        
        /// Пройден раунд с 10 ошибками
        if artefact.nameArtefact == "Ara-kua" {
            let value = UserDefaults.standard.integer(forKey: "10_Error")
            countBack.isHidden = value > 0 ? false : true
            artefactImage.image = value > 0 ? artefact.image : artefact.image.noir
            countLabel.text = String(value)
        }
        
        /// Пройден раунд с 7 ошибками
        if artefact.nameArtefact == "Laki" {
            let value = UserDefaults.standard.integer(forKey: "7_Error")
            countBack.isHidden = value > 0 ? false : true
            artefactImage.image = value > 0 ? artefact.image : artefact.image.noir
            countLabel.text = String(value)
        }
        
        /// Пройден раунд с 3 ошибками
        if artefact.nameArtefact == "Lanakila" {
            let value = UserDefaults.standard.integer(forKey: "3_Error")
            countBack.isHidden = value > 0 ? false : true
            artefactImage.image = value > 0 ? artefact.image : artefact.image.noir
            countLabel.text = String(value)
        }
        
        /// пройден раунд без ошибок
        if artefact.nameArtefact == "Oi-loa" {
            let value = UserDefaults.standard.integer(forKey: "NoError")
            countBack.isHidden = value > 0 ? false : true
            artefactImage.image = value > 0 ? artefact.image : artefact.image.noir
            countLabel.text = String(value)
        }
        
        
        ///
        ///  --------------------------------
        
        
        
        
        
        
        
        
        
        
        
        
        ///
        ///  --------------------------------

        
        /// Пройден раунд менее чем за 15 секунд
        if artefact.nameArtefact == "Wiki-wiki" {
            let value = UserDefaults.standard.integer(forKey: "Less15Seconds")
            countBack.isHidden = value > 0 ? false : true
            artefactImage.image = value > 0 ? artefact.image : artefact.image.noir
            countLabel.text = String(value)
        }
        
        
        ///
        ///  --------------------------------
        
        
        /// Сыграно 1000 раундов
        if artefact.nameArtefact == "Mayka-lo" {
            let valueBool = UserDefaults.standard.bool(forKey: "1000RoundsDone")
            countBack.isHidden = valueBool == true ? false : true
            artefactImage.image = valueBool == true ? artefact.image : artefact.image.noir
            countLabel.text = "✓"
        }
        
        /// Сыграно 500 раундов
        if artefact.nameArtefact == "Ho-oikaika" {
            let valueBool = UserDefaults.standard.bool(forKey: "500RoundsDone")
            countBack.isHidden = valueBool == true ? false : true
            artefactImage.image = valueBool == true ? artefact.image : artefact.image.noir
            countLabel.text = "✓"
        }
        
        /// Сыграно 300 раундов
        if artefact.nameArtefact == "Ho-omau" {
            let valueBool = UserDefaults.standard.bool(forKey: "300RoundsDone")
            countBack.isHidden = valueBool == true ? false : true
            artefactImage.image = valueBool == true ? artefact.image : artefact.image.noir
            countLabel.text = "✓"
        }
        
        /// Сыграно 200 раундов
        if artefact.nameArtefact == "Aole ino" {
            let valueBool = UserDefaults.standard.bool(forKey: "200RoundsDone")
            countBack.isHidden = valueBool == true ? false : true
            artefactImage.image = valueBool == true ? artefact.image : artefact.image.noir
            countLabel.text = "✓"
        }
        
        /// Сыграно 100 раундов
        if artefact.nameArtefact == "Ho-olohe" {
            let valueBool = UserDefaults.standard.bool(forKey: "100RoundsDone")
            countBack.isHidden = valueBool == true ? false : true
            artefactImage.image = valueBool == true ? artefact.image : artefact.image.noir
            countLabel.text = "✓"
        }
        
        /// Сыграно 50 раундов
        if artefact.nameArtefact == "Kiai holoholona" {
            let valueBool = UserDefaults.standard.bool(forKey: "50RoundsDone")
            countBack.isHidden = valueBool == true ? false : true
            artefactImage.image = valueBool == true ? artefact.image : artefact.image.noir
            countLabel.text = "✓"
        }
        
        
        ///
        ///  --------------------------------
        
        
        /// Пройдены все уровни
        if artefact.nameArtefact == "Topu-topu" {
            if UserDefaults.standard.integer(forKey: "CountFruitRound") > 0 &&
                UserDefaults.standard.integer(forKey: "CountFlagRound") > 0 &&
                UserDefaults.standard.integer(forKey: "CountFarmRound") > 0 &&
                UserDefaults.standard.integer(forKey: "CountAnimalsRound") > 0 &&
                UserDefaults.standard.integer(forKey: "CountAlfredRound") > 0 &&
                UserDefaults.standard.integer(forKey: "CountZooRound") > 0 &&
                UserDefaults.standard.integer(forKey: "CountMandalaRound") > 0 &&
                UserDefaults.standard.integer(forKey: "CountNinjaRound") > 0 &&
                UserDefaults.standard.integer(forKey: "CountSportRound") > 0 &&
                UserDefaults.standard.integer(forKey: "CountSummerRound") > 0 &&
                UserDefaults.standard.integer(forKey: "CountToyRound") > 0 &&
                UserDefaults.standard.integer(forKey: "CountDogRound") > 0 &&
                UserDefaults.standard.integer(forKey: "CountToddlerRound") > 0 &&
                UserDefaults.standard.integer(forKey: "CountVegetableRound") > 0 &&
                UserDefaults.standard.integer(forKey: "CountSpaceRound") > 0 &&
                UserDefaults.standard.integer(forKey: "CountLetterRound") > 0 &&
                UserDefaults.standard.integer(forKey: "CountOrigamiRound") > 0 &&
                UserDefaults.standard.integer(forKey: "CountСuteRound") > 0 &&
                UserDefaults.standard.integer(forKey: "CountFlowerRound") > 0 &&
                UserDefaults.standard.integer(forKey: "CountFaunaRound") > 0
            {
                countBack.isHidden = false
                artefactImage.image = artefact.image
            } else {
                countBack.isHidden = true
                artefactImage.image = artefact.image.noir
            }
            countLabel.text = "✓"
        }
        
        
        ///
        ///  --------------------------------
        
        
        /// Пройдены все уровни с животными
        if artefact.nameArtefact == "Sepako" {
            if UserDefaults.standard.integer(forKey: "CountAnimalsRound") > 0 &&
                UserDefaults.standard.integer(forKey: "CountAlfredRound") > 0 &&
                UserDefaults.standard.integer(forKey: "CountZooRound") > 0 &&
                UserDefaults.standard.integer(forKey: "CountDogRound") > 0 &&
                UserDefaults.standard.integer(forKey: "CountСuteRound") > 0 &&
                UserDefaults.standard.integer(forKey: "CountFaunaRound") > 0
            {
                countBack.isHidden = false
                artefactImage.image = artefact.image
            } else {
                countBack.isHidden = true
                artefactImage.image = artefact.image.noir
            }
            countLabel.text = "✓"
        }
        
        
        ///
        ///  --------------------------------

        
        /// пройден уровень фрукты
        if artefact.nameArtefact == "Hua" {
            let value = UserDefaults.standard.integer(forKey: "CountFruitRound")
            countBack.isHidden = value > 0 ? false : true
            artefactImage.image = value > 0 ? artefact.image : artefact.image.noir
            countLabel.text = String(value)
        }
        
        /// пройден уровень Флаги
        if artefact.nameArtefact == "Tuta" {
            let value = UserDefaults.standard.integer(forKey: "CountFlagRound")
            countBack.isHidden = value > 0 ? false : true
            artefactImage.image = value > 0 ? artefact.image : artefact.image.noir
            countLabel.text = String(value)
        }
        
        /// пройден уровень Ферма
        if artefact.nameArtefact == "Huakai" {
            let value = UserDefaults.standard.integer(forKey: "CountFarmRound")
            countBack.isHidden = value > 0 ? false : true
            artefactImage.image = value > 0 ? artefact.image : artefact.image.noir
            countLabel.text = String(value)
        }
        
        /// пройден уровень Животные
        if artefact.nameArtefact == "Dabbobi" {
            let value = UserDefaults.standard.integer(forKey: "CountAnimalsRound")
            countBack.isHidden = value > 0 ? false : true
            artefactImage.image = value > 0 ? artefact.image : artefact.image.noir
            countLabel.text = String(value)
        }
        
        /// пройден уровень Alfred
        if artefact.nameArtefact == "Nele" {
            let value = UserDefaults.standard.integer(forKey: "CountAlfredRound")
            countBack.isHidden = value > 0 ? false : true
            artefactImage.image = value > 0 ? artefact.image : artefact.image.noir
            countLabel.text = String(value)
        }
        
        /// пройден уровень Зоопарк
        if artefact.nameArtefact == "Kada" {
            let value = UserDefaults.standard.integer(forKey: "CountZooRound")
            countBack.isHidden = value > 0 ? false : true
            artefactImage.image = value > 0 ? artefact.image : artefact.image.noir
            countLabel.text = String(value)
        }
        
        /// пройден уровень Узоры
        if artefact.nameArtefact == "Kaukua" {
            let value = UserDefaults.standard.integer(forKey: "CountMandalaRound")
            countBack.isHidden = value > 0 ? false : true
            artefactImage.image = value > 0 ? artefact.image : artefact.image.noir
            countLabel.text = String(value)
        }
        
        /// пройден уровень Ниндзя
        if artefact.nameArtefact == "Koa" {
            let value = UserDefaults.standard.integer(forKey: "CountNinjaRound")
            countBack.isHidden = value > 0 ? false : true
            artefactImage.image = value > 0 ? artefact.image : artefact.image.noir
            countLabel.text = String(value)
        }
        
        /// пройден уровень Спорт
        if artefact.nameArtefact == "Hauki" {
            let value = UserDefaults.standard.integer(forKey: "CountSportRound")
            countBack.isHidden = value > 0 ? false : true
            artefactImage.image = value > 0 ? artefact.image : artefact.image.noir
            countLabel.text = String(value)
        }
        
        /// пройден уровень Лето
        if artefact.nameArtefact == "Kauwela" {
            let value = UserDefaults.standard.integer(forKey: "CountSummerRound")
            countBack.isHidden = value > 0 ? false : true
            artefactImage.image = value > 0 ? artefact.image : artefact.image.noir
            countLabel.text = String(value)
        }
        
        /// пройден уровень Игрушки
        if artefact.nameArtefact == "Keiki" {
            let value = UserDefaults.standard.integer(forKey: "CountToyRound")
            countBack.isHidden = value > 0 ? false : true
            artefactImage.image = value > 0 ? artefact.image : artefact.image.noir
            countLabel.text = String(value)
        }
        
        /// пройден уровень Собаки
        if artefact.nameArtefact == "Ilio" {
            let value = UserDefaults.standard.integer(forKey: "CountDogRound")
            countBack.isHidden = value > 0 ? false : true
            artefactImage.image = value > 0 ? artefact.image : artefact.image.noir
            countLabel.text = String(value)
        }
        
        /// пройден уровень Карапуз
        if artefact.nameArtefact == "Mea-paani" {
            let value = UserDefaults.standard.integer(forKey: "CountToddlerRound")
            countBack.isHidden = value > 0 ? false : true
            artefactImage.image = value > 0 ? artefact.image : artefact.image.noir
            countLabel.text = String(value)
        }
        
        /// пройден уровень Овощи
        if artefact.nameArtefact == "Mea-kanu" {
            let value = UserDefaults.standard.integer(forKey: "CountVegetableRound")
            countBack.isHidden = value > 0 ? false : true
            artefactImage.image = value > 0 ? artefact.image : artefact.image.noir
            countLabel.text = String(value)
        }
        
        /// пройден уровень Космос
        if artefact.nameArtefact == "Hoku" {
            let value = UserDefaults.standard.integer(forKey: "CountSpaceRound")
            countBack.isHidden = value > 0 ? false : true
            artefactImage.image = value > 0 ? artefact.image : artefact.image.noir
            countLabel.text = String(value)
        }
        
        /// пройден уровень Буквы
        if artefact.nameArtefact == "Palapala" {
            let value = UserDefaults.standard.integer(forKey: "CountLetterRound")
            countBack.isHidden = value > 0 ? false : true
            artefactImage.image = value > 0 ? artefact.image : artefact.image.noir
            countLabel.text = String(value)
        }
        
        /// пройден уровень Оригами
        if artefact.nameArtefact == "Hana-lima" {
            let value = UserDefaults.standard.integer(forKey: "CountOrigamiRound")
            countBack.isHidden = value > 0 ? false : true
            artefactImage.image = value > 0 ? artefact.image : artefact.image.noir
            countLabel.text = String(value)
        }
        
        /// пройден уровень Милота
        if artefact.nameArtefact == "Olu-Olu" {
            let value = UserDefaults.standard.integer(forKey: "CountСuteRound")
            countBack.isHidden = value > 0 ? false : true
            artefactImage.image = value > 0 ? artefact.image : artefact.image.noir
            countLabel.text = String(value)
        }
        
        /// пройден уровень Цветы
        if artefact.nameArtefact == "Pua" {
            let value = UserDefaults.standard.integer(forKey: "CountFlowerRound")
            countBack.isHidden = value > 0 ? false : true
            artefactImage.image = value > 0 ? artefact.image : artefact.image.noir
            countLabel.text = String(value)
        }
        
        /// пройден уровень Фауна
        if artefact.nameArtefact == "Holoholona" {
            let value = UserDefaults.standard.integer(forKey: "CountFaunaRound")
            countBack.isHidden = value > 0 ? false : true
            artefactImage.image = value > 0 ? artefact.image : artefact.image.noir
            countLabel.text = String(value)
        }

    }
}
