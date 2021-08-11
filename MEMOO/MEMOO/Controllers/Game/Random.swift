import UIKit

extension GameViewController {
    
    func randomImages() -> NSArray {
        
        let images = NSMutableArray()
        while images.count < 10 {
            let i = arc4random() % 20 + 1
            let image: UIImage = UIImage(named: "\(nameCard!)\(i)")!
            if !images.contains(image) {
                images.add(image)
            }
        }
        return images
    }
}
