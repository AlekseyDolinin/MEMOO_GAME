import UIKit

struct Card {
    var id: Int
    var image: UIImage
    var showCard: Bool
    
    init(id: Int,
         image: UIImage,
         showCard: Bool
        ){
        self.id = id
        self.image = image
        self.showCard = showCard
    }
}
