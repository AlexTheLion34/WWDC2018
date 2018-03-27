import UIKit

extension UIVisualEffectView {
    
    public func setupVisualEffectView() {
        self.frame = CGRect(x: 0, y: 0, width: 300, height: 500)
        self.effect = UIBlurEffect(style: .regular)
    }
    
}

