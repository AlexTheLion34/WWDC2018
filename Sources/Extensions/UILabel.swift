import UIKit

extension UILabel {
    
    public func setupLabelAppearence(x: Double, y: Double, width: Double, height: Double) {
        self.frame = CGRect(x: x, y: y, width: width, height: height)
        self.alpha = 1
        self.textAlignment = .center
        self.textColor = Design.secondMainColor
        self.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 16)
    }
    
    public func setupMainControllerDescriptionLabel() {
        self.frame = CGRect(x: 600.0, y: 15.0, width: 200, height: 40)
        self.textColor = Design.secondMainColor
        self.alpha = 1
        self.textAlignment = .center
        self.lineBreakMode = .byWordWrapping
        self.numberOfLines = 2
        self.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 16)
        self.text = "Here you can explore my life.\nWhen finish, press Exit."
    }
    
    public func setupFirstControllerTitleLabel() {
        self.frame = CGRect(x: 40, y: 20, width: 220, height: 50)
        self.layer.borderWidth = 2
        self.layer.borderColor = Design.secondMainColor.cgColor
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        self.text = "WWDC2018"
        self.textAlignment = .center
        self.textColor = UIColor.white
        self.font = UIFont(name: "AppleSDGothicNeo-Light" , size: 40)
        self.alpha = 0
    }
    
    public func setupFirstControllerWelcomeLabel() {
        self.frame = CGRect(x: 40, y: 255, width: 260, height: 60)
        self.lineBreakMode = .byWordWrapping
        self.numberOfLines = 3
        self.text = "Hello there, my name is Aleksey!\nThis is my WWDC2018 submition."
        self.textColor = UIColor.white
        self.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 16)
        self.alpha = 0
    }
    
    public func setupSkillsControllerLanguageLabel(withText text: String) {
        self.frame = CGRect(x: 60, y: 17.5, width: 60, height: 40)
        self.text = text
        self.textColor = Design.firstMainColor
    }
    
    public func setupAboutMeControllerHeadingLabel() {
        self.textColor = Design.firstMainColor
        self.text = "title"
        self.textAlignment = .center
        self.font = UIFont(name: "AppleSDGothicNeo-Light", size: 16)
    }
    
    public func setupAboutMeControllerTextLabel() {
        self.textColor = Design.firstMainColor
        self.numberOfLines = 25
        self.font = UIFont(name: "AppleSDGothicNeo-Light", size: 14)
        self.textAlignment = .justified
        self.sizeToFit()
    }
    
    public func setupProjectsControllerAppLabel() {
        self.frame = CGRect(x: 315, y: 290, width: 70, height: 20)
        self.textColor = Design.secondMainColor
        self.text = "Pumping"
        self.font = UIFont(name: "AppleSDGothicNeo-Light", size: 16)
        self.textAlignment = .center
    }
    
    public func setupProjectsControllerIntroductionLabel() {
        self.frame = CGRect(x: 55, y: 60, width: 190, height: 110)
        self.text = readFromFile(withName: "AppDescription")
        self.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 15)
        self.textColor = Design.secondMainColor
        self.alpha = 0
        self.numberOfLines = 15
        self.textAlignment = .justified
        self.sizeToFit()
    }
}
