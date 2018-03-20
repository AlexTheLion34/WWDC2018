import UIKit

public class FirstViewController: UIViewController, CAAnimationDelegate {
    
    let gradientColors = [#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1).cgColor, #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1).cgColor, #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).cgColor, #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1).cgColor, #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1).cgColor, #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1).cgColor]
    
    var gradientLayer: CAGradientLayer! {
        didSet {
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 1, y: 0)
            gradientLayer.colors = gradientColors
        }
    }
    
    var shapeLayer: CAShapeLayer! {
        didSet {
            let color = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
            shapeLayer.lineWidth = 10
            shapeLayer.lineCap = "round"
            shapeLayer.fillColor = nil
            shapeLayer.strokeEnd = 1
            shapeLayer.strokeColor = color
        }
    }
    
    var overShapeLayer: CAShapeLayer! {
        didSet {
            let color = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
            overShapeLayer.lineWidth = 10
            overShapeLayer.lineCap = "round"
            overShapeLayer.fillColor = nil
            overShapeLayer.strokeEnd = 0
            overShapeLayer.strokeColor = color
        }
    }
    
    func setupShapeLayer(_ shapeLayer: CAShapeLayer) {
        shapeLayer.frame = view.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(x: self.view.frame.width / 2 - 100, y: self.view.frame.height / 4 + 300))
        path.addLine(to: CGPoint(x: self.view.frame.width / 2 + 100, y: self.view.frame.height / 4 + 300))
        shapeLayer.path = path.cgPath
    }
    
    public override func viewDidLayoutSubviews() {
        gradientLayer.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
        setupShapeLayer(shapeLayer)
        setupShapeLayer(overShapeLayer)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        gradientLayer = CAGradientLayer()
        shapeLayer = CAShapeLayer()
        overShapeLayer = CAShapeLayer()
        
        view.layer.insertSublayer(gradientLayer, at: 0)
        view.layer.addSublayer(shapeLayer)
        view.layer.addSublayer(overShapeLayer)
        
        let imageView = UIImageView(frame: CGRect(x: 230, y: 22, width: 45, height: 45))
        imageView.image = UIImage(named: "Apple.png")
        view.addSubview(imageView)
        
        let secondImageView = UIImageView(frame: CGRect(x: 100, y: 150, width: 100, height: 100))
        secondImageView.image = UIImage(named: "Alex.jpg")
        secondImageView.layer.cornerRadius = 50
        secondImageView.layer.masksToBounds = true
        secondImageView.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        secondImageView.layer.borderWidth = 2
        view.addSubview(secondImageView)
        
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 100, y: 325, width: 100, height: 50)
        button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.layer.borderWidth = 2
        button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.setTitle("Start", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.alpha = 0.8
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        view.addSubview(button)
        
        let label = UILabel(frame: CGRect(x: 20, y: 20, width: 260, height: 55))
        label.layer.borderWidth = 2
        label.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        label.text = " WWDC2018"
        label.textColor = UIColor.white
        label.font = UIFont(name: "AppleSDGothicNeo-Light" , size: 40)
        view.addSubview(label)
        
        perfomBluring()
    }
    
    @objc func buttonAction() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 3
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.fillMode = kCAFillModeBoth
        animation.isRemovedOnCompletion = false
        animation.delegate = self
        overShapeLayer.add(animation, forKey: nil)
    }
    
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        let nextViewController = MainViewController()
        self.present(nextViewController, animated: true, completion: nil)
        
    }
    
    func perfomBluring() {
        let blureEffect = UIBlurEffect(style: .regular)
        let blerEffectView = UIVisualEffectView(effect: blureEffect)
        blerEffectView.frame = self.view.bounds
        blerEffectView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.view.insertSubview(blerEffectView, at: 1)
    }
    
}

