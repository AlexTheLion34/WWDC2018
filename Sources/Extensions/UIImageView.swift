import UIKit

extension UIImageView {
    
    public func setupMyPhoto() {
        self.frame = CGRect(x: 100, y: 145, width: 100, height: 100)
        self.image = UIImage(named: "Alex.jpg")
        self.layer.cornerRadius = 50
        self.layer.masksToBounds = true
        self.layer.borderColor = Design.secondMainColor.cgColor
        self.layer.borderWidth = 2
        self.alpha = 0
    }
    
    public func setupLanguageImageView(withImage image: String) {
        self.frame = CGRect(x: 5, y: 12.5, width: 50, height: 50)
        self.image = UIImage(named: image)
    }
}
