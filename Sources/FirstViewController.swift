import UIKit

public class FirstViewController: UIViewController, CAAnimationDelegate {
    
    let gradientColors = [#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1).cgColor, #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1).cgColor, #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).cgColor, #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1).cgColor, #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1).cgColor, #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1).cgColor]
    
    var myPhotoImageView: UIImageView! {
        didSet {
            myPhotoImageView.frame = CGRect(x: 100, y: 180, width: 100, height: 100)
            myPhotoImageView.image = UIImage(named: "Alex.jpg")
            myPhotoImageView.layer.cornerRadius = 50
            myPhotoImageView.layer.masksToBounds = true
            myPhotoImageView.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            myPhotoImageView.layer.borderWidth = 2
            myPhotoImageView.alpha = 0
        }
    }
    
    var appleImageView: UIImageView! {
        didSet {
            appleImageView.frame = CGRect(x: 230, y: 22, width: 45, height: 45)
            appleImageView.image = UIImage(named: "Apple.png")
            appleImageView.alpha = 0
        }
    }
    
    var gradientLayer: CAGradientLayer! {
        didSet {
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 1, y: 0)
            gradientLayer.colors = gradientColors
        }
    }
    
    var titleLabel: UILabel! {
        didSet {
            titleLabel.frame = CGRect(x: 20, y: 20, width: 260, height: 55)
            titleLabel.layer.borderWidth = 3
            titleLabel.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            titleLabel.layer.cornerRadius = 8
            titleLabel.layer.masksToBounds = true
            titleLabel.text = " WWDC2018"
            titleLabel.textColor = UIColor.white
            titleLabel.font = UIFont(name: "AppleSDGothicNeo-Light" , size: 40)
            titleLabel.alpha = 0
        }
    }
    
    var welcomeLabel: UILabel! {
        didSet {
            welcomeLabel.frame = CGRect(x: 40, y: 90, width: 260, height: 60)
            welcomeLabel.lineBreakMode = .byWordWrapping
            welcomeLabel.numberOfLines = 3
            welcomeLabel.text = "Hello there, my name is Aleksey!\nThis is my WWDC2018 submition.\nTo begin the journey, press Start."
            welcomeLabel.textColor = UIColor.white
            welcomeLabel.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 16)
            welcomeLabel.alpha = 0
        }
    }
    
    var startButton: UIButton! {
        didSet {
            startButton.frame = CGRect(x: 100, y: 325, width: 100, height: 50)
            startButton.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            startButton.layer.cornerRadius = 8
            startButton.layer.masksToBounds = true
            startButton.setTitle("Start", for: .normal)
            startButton.setTitleColor(UIColor.black, for: .normal)
            startButton.alpha = 0.8
            startButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            startButton.alpha = 0
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
        setupShapeLayer(overShapeLayer)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        gradientLayer = CAGradientLayer()
        shapeLayer = CAShapeLayer()
        overShapeLayer = CAShapeLayer()
        appleImageView = UIImageView()
        myPhotoImageView = UIImageView()
        welcomeLabel = UILabel()
        titleLabel = UILabel()
        startButton = UIButton(type: .system)
        
        view.layer.insertSublayer(gradientLayer, at: 0)
        view.layer.addSublayer(shapeLayer)
        view.layer.addSublayer(overShapeLayer)
        
        view.addSubview(appleImageView)
        view.addSubview(myPhotoImageView)
        view.addSubview(welcomeLabel)
        view.addSubview(titleLabel)
        view.addSubview(startButton)
        
        perfomBluring()
        animateItems()
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
    
    func animateItems() {
        UIView.animate(withDuration: 1.5, animations: {
            self.titleLabel.alpha = 1.0
            self.appleImageView.alpha = 1.0
        }, completion: {
            (Completed: Bool) -> Void in
            UIView.animate(withDuration: 1.5, delay: 1.0, options: UIViewAnimationOptions.curveLinear, animations: {
                self.welcomeLabel.alpha = 1
            }, completion: {
                (Completed: Bool) -> Void in
                UIView.animate(withDuration: 1.5, delay: 3.0, options: UIViewAnimationOptions.curveLinear, animations: {
                    self.myPhotoImageView.alpha = 1
                }, completion: {
                    (Completed: Bool) -> Void in
                    UIView.animate(withDuration: 1.5, delay: 1.0, options: UIViewAnimationOptions.curveLinear, animations: {
                        self.startButton.alpha = 0.8
                    }, completion: {
                        (Completed: Bool) -> Void in
                        UIView.animate(withDuration: 2.0, delay: 1.0, options: UIViewAnimationOptions.curveLinear, animations: {
                            self.setupShapeLayer(self.shapeLayer)
                        }, completion: {
                            (Completed: Bool) -> Void in
                            return
                        })
                    })
                })
            })
        })
    }
    
    func perfomBluring() {
        let blureEffect = UIBlurEffect(style: .regular)
        let blerEffectView = UIVisualEffectView(effect: blureEffect)
        blerEffectView.frame = self.view.bounds
        blerEffectView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.view.insertSubview(blerEffectView, at: 1)
    }
    
}
