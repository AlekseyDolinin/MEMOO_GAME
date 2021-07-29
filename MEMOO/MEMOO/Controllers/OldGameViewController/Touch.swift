import UIKit

extension OldGameViewController {

    ///
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if touch?.view?.isKind(of: CardView.self) ?? false {
            let currentTouchView = touch?.view as! CardView
            currentTouchView.showCard()

            /// если нет открытых карточек
            if tempImageView == nil {
                tempImageView = currentTouchView
            } else {
                /// если тэги открытых карточек совпали
                if currentTouchView.cardTag == self.tempImageView.cardTag {
                    tempImageView = nil
                    matchCount = matchCount + 1
                    if matchCount == 10 {
                        gameWin()
                    }
                } else {
                    /// если тэги открытых карточек не совпали
                    tempImageView.hideCard()
                    tempImageView = currentTouchView
                }
            }
        }
    }

}
