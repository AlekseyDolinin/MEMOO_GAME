import UIKit

///
class Button_: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    private func setup() {
        guard let fontTitle = UIFont(name: "RF-Krabuler-Regular.otf", size: 30.0) else {
            print("error font")
            return
        }
        self.titleLabel?.font = fontTitle
    }
}
