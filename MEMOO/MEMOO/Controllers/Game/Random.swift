import UIKit

extension GameViewController {
    
//    func randomTags() -> NSArray {
//        let mArray: NSMutableArray =  NSMutableArray()
//        while mArray.count < countCell {
//            let tag = arc4random() % UInt32(countCell)
//            let t = NSNumber(value: tag)
//            if !mArray.contains(t) {
//                mArray.add(t)
//            }
//        }
//        return mArray
//    }
    
    func randomImages() -> NSArray {
        
        var nameCard: String!
        switch contentGame {
        case "fruits":
            nameCard = "fruit"
        case "dinosaurs":
            nameCard = "dinoCad_"
        case "monsters":
            nameCard = "monster_"
        default:
            break
        }

        
        
        let images = NSMutableArray()
        while images.count < 10 {
            let i = arc4random() % 18 + 1
            let image: UIImage = UIImage(named: "\(nameCard!)\(i)")!
            if !images.contains(image) {
                images.add(image)
            }
        }
        return images
    }
}
