import UIKit

struct Card {
    var id: Int
    var tag: Int
    var image: UIImage
    var showCard: Bool
    
    init(id: Int,
         tag: Int,
         image: UIImage,
         showCard: Bool
        ){
        self.id = id
        self.tag = tag
        self.image = image
        self.showCard = showCard
    }
}
