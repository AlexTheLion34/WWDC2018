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
    
    @objc public func goBack() {
        let previousViewController = MainViewController()
        previousViewController.modalTransitionStyle = .crossDissolve
        present(previousViewController, animated: true, completion: nil)
    }
    
    @objc public func firstButtonAction() {
        let nextController = AboutMeViewController()
        nextController.modalTransitionStyle = .crossDissolve
        present(nextController, animated: true, completion: nil)
    }
    
    @objc public func secondButtonAction() {
        let nextController = SkillsViewController()
        nextController.modalTransitionStyle = .crossDissolve
        present(nextController, animated: true, completion: nil)
    }
    
    @objc public func thirdButtonAction() {
        let nextController = HobbiesViewController()
        nextController.modalTransitionStyle = .crossDissolve
        present(nextController, animated: true, completion: nil)
    }
    
    @objc public func fourthButtonAction() {
        let nextController = ProjectsViewController()
        //nextController.modalTransitionStyle = .partialCurl
        present(nextController, animated: true, completion: nil)
    }
    
    public func setPopView() -> (UIView) {
        let popView = UIView()
        let scrollView = UIScrollView()
        let imageView = UIImageView()
        let label = UILabel()
        label.frame = CGRect(x: 5, y: 160, width: 220, height: 250)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 50
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.frame = CGRect(x: 5, y: 5, width: 220, height: 150)
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.alpha = 1
        scrollView.frame = CGRect(x: 5, y: 5, width: 230, height: 310)
        scrollView.layer.cornerRadius = 10
        scrollView.alpha = 1.0
        scrollView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let bottomOffset = CGPoint(x: 0, y: 0)
        scrollView.setContentOffset(bottomOffset, animated: true)
        popView.frame = CGRect(x: 30, y: 75, width: 240, height: 350)
        popView.alpha = 0
        popView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        popView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        popView.layer.shadowOffset = CGSize(width: 0, height: 5)
        popView.layer.shadowOpacity = 1
        popView.layer.shadowRadius = 5
        popView.layer.cornerRadius = 10
        scrollView.addSubview(label)
        scrollView.addSubview(imageView)
        scrollView.contentSize = CGSize(width: 230, height: 410)
        popView.addSubview(scrollView)
        return(popView)
    }
    
}
