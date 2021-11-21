import UIKit

extension GameViewController {
    func randomImages() -> [UIImage] {
        var images = [UIImage]()
        while images.count < 10 {
            let i = arc4random() % 20 + 1
            let image: UIImage = UIImage(named: "\(StartViewController.selectRound.name)\(i)")!
            if !images.contains(image) {
                images.append(image)
            }
        }
        return images
    }
}
