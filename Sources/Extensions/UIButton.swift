import UIKit

extension UIButton {
    
    public func setupMainControllerButtonAppearence(x: Double, y: Double, width: Double, height: Double) {
        self.frame = CGRect(x: x, y: y, width: 80, height: 80)
        self.alpha = 0.7
        self.tintColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.layer.borderWidth = 0.5
        self.layer.borderColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        self.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 5.0
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 40
    }
    
    public func setupExitButton() {
        self.frame = CGRect(x: 10, y: 10, width: 35, height: 35)
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 2.5
        self.layer.borderWidth = 1.5
        self.layer.borderColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        self.tintColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 17.5
        self.setImage(UIImage(named: "Exit.png"), for: .normal)
    }
    
    public func setupEndButton() {
        self.frame = CGRect(x: 255.0, y: 510.0, width: 35, height: 35)
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 2.5
        self.tintColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        self.layer.masksToBounds = false
        self.alpha = 1
        self.setImage(UIImage(named: "End.png"), for: .normal)
    }
    
}
