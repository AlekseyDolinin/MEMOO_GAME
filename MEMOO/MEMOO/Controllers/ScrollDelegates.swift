import UIKit

extension StartViewController {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if scrollView == startView.contentGameCollection {
            let layout = startView.contentGameCollection.collectionViewLayout as? SnapPagingLayout
            layout?.willBeginDragging()
        }
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if scrollView == startView.contentGameCollection {
            let layout = startView.contentGameCollection.collectionViewLayout as? SnapPagingLayout
            layout?.willEndDragging(withVelocity: velocity, targetContentOffset: targetContentOffset)
        }
    }
}
