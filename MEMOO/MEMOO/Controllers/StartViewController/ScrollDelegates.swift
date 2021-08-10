import UIKit

extension StartViewController {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let visibleRect = CGRect(origin: startView.contentGameCollection.contentOffset, size: startView.contentGameCollection.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        let indexPath = startView.contentGameCollection.indexPathForItem(at: visiblePoint)
        currentIndex = indexPath?.row ?? 0
    }
    
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
