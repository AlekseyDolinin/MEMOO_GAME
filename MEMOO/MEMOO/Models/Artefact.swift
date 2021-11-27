import UIKit

struct Artefact {
    var id: Int
    var image: UIImage
    
    init(id: Int,
         image: UIImage,
         showCard: Bool
        ){
        self.id = id
        self.image = image
    }
}
