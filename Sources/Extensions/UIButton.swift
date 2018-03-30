import UIKit

extension UIButton {
    
    public func setupMainControllerButtonAppearence(x: Double, y: Double, width: Double, height: Double) {
        self.frame = CGRect(x: x, y: y, width: 80, height: 80)
        self.alpha = 0.7
        self.tintColor = Design.firstMainColor
        self.layer.shadowColor = Design.shadowColor.cgColor
        self.backgroundColor = Design.secondMainColor
        self.layer.borderWidth = 0.5
        self.layer.borderColor = Design.firstMainColor.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 5.0
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 40
    }
    
    public func setupExitButton() {
        self.frame = CGRect(x: 10, y: 10, width: 35, height: 35)
        self.layer.shadowColor = Design.shadowColor.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 2.5
        self.layer.borderWidth = 1.5
        self.layer.borderColor = Design.firstMainColor.cgColor
        self.tintColor = Design.firstMainColor
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 17.5
        self.setImage(UIImage(named: "Exit.png"), for: .normal)
    }
    
    public func setupEndButton() {
        self.frame = CGRect(x: 255.0, y: 510.0, width: 35, height: 35)
        self.layer.shadowColor = Design.shadowColor.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 2.5
        self.tintColor = Design.firstMainColor
        self.layer.masksToBounds = false
        self.alpha = 1
        self.setImage(UIImage(named: "End.png"), for: .normal)
    }
    
    public func setupHobbiesControllerButtonAppearence(x: Double, y: Double, width: Double, height: Double) {
        self.frame = CGRect(x: x, y: y, width: width, height: height)
        self.alpha = 0.7
        self.tintColor = Design.firstMainColor
        self.layer.shadowColor = Design.shadowColor.cgColor
        self.backgroundColor = Design.secondMainColor
        self.layer.borderWidth = 0.5
        self.layer.borderColor = Design.firstMainColor.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 5.0
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 40
    }
    
    public func setupPopUpExitButton() {
        self.frame = CGRect(x: 105.0, y: 320.0, width: 30.0, height: 30.0)
        self.alpha = 1
        self.tintColor = Design.firstMainColor
        self.setImage(UIImage(named: "PopUpExit.png"), for: .normal)
    }
    
    public func setupProjectsControllerAppButton() {
        self.frame = CGRect(x: 315, y: 215, width: 70, height: 70)
        self.backgroundColor = Design.secondMainColor
        self.setImage(UIImage(named: "Pumping.png"), for: .normal)
        self.tintColor = Design.shadowColor
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
    }
}
