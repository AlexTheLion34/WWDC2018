import UIKit

extension UISegmentedControl {
   public func setupSegmentedControll() {
        self.frame = CGRect(x: 10, y: 5, width: 240, height: 20)
        self.layer.cornerRadius = 5.0  
        self.backgroundColor = Design.secondMainColor
        self.tintColor = Design.firstMainColor
    }
}
