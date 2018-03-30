import UIKit

extension UITableViewCell {
    
    public func setUpTableViewCell() {
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = Design.firstMainColor.cgColor
    }
    
}

