

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var layer_1: UIImageView!
    @IBOutlet weak var layer_2: UIImageView!
    @IBOutlet weak var layer_3: UIImageView!
    @IBOutlet weak var scroll: UIScrollView!
    
    private var lastContentOffset: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scroll.delegate = self
        
    }


}


extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (self.lastContentOffset > scrollView.contentOffset.x) {
            print(11)
        } else if (self.lastContentOffset < scrollView.contentOffset.x) {
            print(22)
        }

        // update the new position acquired
        self.lastContentOffset = scrollView.contentOffset.x
        
        print(self.lastContentOffset)
        layer_1.transform = CGAffineTransform(translationX: -self.lastContentOffset * 0.4, y: 0)
        layer_2.transform = CGAffineTransform(translationX: -self.lastContentOffset * 0.6, y: 0)
        layer_3.transform = CGAffineTransform(translationX: -self.lastContentOffset * 0.8, y: 0)
    }
    
    
}
