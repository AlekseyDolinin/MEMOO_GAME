import UIKit

struct Round {
    var id: Int
    var name: String
    var imageCover: String
    var complexity: Complexity
    
    init(id: Int,
         name: String,
         imageCover: String,
         complexity: Complexity
    ){
        self.id = id
        self.name = name
        self.imageCover = imageCover
        self.complexity = complexity
    }
}

enum Complexity: String {
    case easily = "easily"
    case medium = "medium"
    case hard = "hard"
}
