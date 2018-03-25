import UIKit

extension UILabel {
    
    public func setupMainControllerLabelAppearence(x: Double, y: Double, width: Double, height: Double) {
        self.frame = CGRect(x: x, y: y, width: width, height: height)
        self.alpha = 1
        self.textAlignment = .center
        self.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 16)
    }
    
    public func setupDescriptionLabel() {
        self.frame = CGRect(x: 600.0, y: 15.0, width: 200, height: 40)
        self.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.alpha = 1
        self.textAlignment = .center
        self.lineBreakMode = .byWordWrapping
        self.numberOfLines = 2
        self.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 16)
        self.text = "Here you can explore my life.\nWhen finish, press Exit."
    }
    
}
