import UIKit

struct Artefact {
    var id: Int
    var image: UIImage
    var nameArtefact: String
    var descriptionArtefact: String
    
    init(id: Int,
         image: UIImage,
         nameArtefact: String,
         descriptionArtefact:String
        ){
        self.id = id
        self.image = image
        self.nameArtefact = nameArtefact
        self.descriptionArtefact = descriptionArtefact
    }
}
