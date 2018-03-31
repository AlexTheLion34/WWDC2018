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
    
    public func setFinishLayer() -> (CAGradientLayer) {
        let gradientColors = [#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor]
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
    
    public func setPopView() -> (UIView) {
        let popView = UIView()
        let scrollView = UIScrollView()
        let imageView = UIImageView()
        let label = UILabel()
        label.frame = CGRect(x: 5, y: 160, width: 220, height: 250)
        label.font = UIFont(name: "AppleSDGothicNeo-Light", size: 14)
        label.textColor = Design.firstMainColor
        label.textAlignment = .justified
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.frame = CGRect(x: 5, y: 5, width: 220, height: 150)
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.alpha = 1
        scrollView.frame = CGRect(x: 5, y: 5, width: 230, height: 310)
        scrollView.layer.cornerRadius = 10
        scrollView.alpha = 1.0
        scrollView.backgroundColor = Design.secondMainColor
        let bottomOffset = CGPoint(x: 0, y: 0)
        scrollView.setContentOffset(bottomOffset, animated: true)
        popView.frame = CGRect(x: 30, y: 75, width: 240, height: 350)
        popView.alpha = 0
        popView.backgroundColor = Design.secondMainColor
        popView.layer.shadowColor = Design.shadowColor.cgColor
        popView.layer.shadowOffset = CGSize(width: 0, height: 5)
        popView.layer.shadowOpacity = 1
        popView.layer.shadowRadius = 5
        popView.layer.cornerRadius = 10
        scrollView.addSubview(label)
        scrollView.addSubview(imageView)
        popView.addSubview(scrollView)
        return(popView)
    }
    
    public func setAdditionalView() -> (UIView) {
        let additionalView = UIView()
        additionalView.frame = CGRect(x: 20, y: 20, width: 260, height: 460)
        additionalView.backgroundColor = Design.secondMainColor
        additionalView.layer.cornerRadius = 10
        additionalView.layer.masksToBounds = true
        return(additionalView)
    }
}
