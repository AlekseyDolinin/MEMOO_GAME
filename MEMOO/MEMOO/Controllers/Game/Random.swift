import UIKit

extension GameViewController {
    
    func randomTags() -> NSArray {
        let mArray: NSMutableArray =  NSMutableArray()
        while mArray.count < countCell {
            let tag = arc4random() % UInt32(countCell)
            let t = NSNumber(value: tag)
            if !mArray.contains(t) {
                mArray.add(t)
            }
        }
        return mArray
    }
    
    func randomImages() -> NSArray {
        let images = NSMutableArray()
        while images.count < 10 {
            let i = arc4random() % 18 + 1
            let image: UIImage = UIImage(named: "fruit\(i).png")!
            if !images.contains(image) {
                images.add(image)
            }
        }
        return images
    }
}
