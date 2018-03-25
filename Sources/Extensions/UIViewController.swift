import UIKit

extension UIViewController {
    
    public func performBluring() {
        let blureEffect = UIBlurEffect(style: .regular)
        let blerEffectView = UIVisualEffectView(effect: blureEffect)
        blerEffectView.frame = self.view.bounds
        blerEffectView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.view.insertSubview(blerEffectView, at: 1)
    }
    
    public func setGradientLayer() -> (CAGradientLayer) {
        let gradientColors = [#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1).cgColor, #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1).cgColor, #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).cgColor, #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1).cgColor, #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1).cgColor, #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1).cgColor]
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.colors = gradientColors
        return gradientLayer
    }
    
    public func setNavigationBar() -> (UINavigationBar) {
        let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 44))
        navigationBar.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        navigationBar.alpha = 0.5
        let navigationItem = UINavigationItem()
        navigationBar.setItems([navigationItem], animated: false)
        return navigationBar
    }
    
    @objc public func goBack() {
        let previousViewController = MainViewController()
        present(previousViewController, animated: true, completion: nil)
    }
    
    @objc public func firstButtonAction() {
        let nextController = AboutMeViewController()
        present(nextController, animated: true, completion: nil)
    }
    
    @objc public func secondButtonAction() {
        let nextController = SkillsViewController()
        present(nextController, animated: true, completion: nil)
    }
    
    @objc public func thirdButtonAction() {
        let nextController = HobbiesViewController()
        present(nextController, animated: true, completion: nil)
    }
    
    @objc public func fourthButtonAction() {
        let nextController = ProjectsViewController()
        present(nextController, animated: true, completion: nil)
    }
    
}
