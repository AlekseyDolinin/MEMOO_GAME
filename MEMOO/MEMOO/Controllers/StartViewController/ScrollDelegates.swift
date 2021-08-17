import UIKit

extension StartViewController {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let visibleRect = CGRect(origin: viewSelf.contentGameCollection.contentOffset, size: viewSelf.contentGameCollection.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        let indexPath = viewSelf.contentGameCollection.indexPathForItem(at: visiblePoint)
        currentIndex = indexPath?.row ?? 0
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if scrollView == viewSelf.contentGameCollection {
            let layout = viewSelf.contentGameCollection.collectionViewLayout as? SnapPagingLayout
            layout?.willBeginDragging()
        }
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if scrollView == viewSelf.contentGameCollection {
            let layout = viewSelf.contentGameCollection.collectionViewLayout as? SnapPagingLayout
            layout?.willEndDragging(withVelocity: velocity, targetContentOffset: targetContentOffset)
        }
    }
}
