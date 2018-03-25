import UIKit

public class FirstViewController: UIViewController, CAAnimationDelegate {
    
    lazy var gradient = setGradientLayer()
    
    var myPhotoImageView: UIImageView! {
        didSet {
            myPhotoImageView.frame = CGRect(x: 100, y: 150, width: 100, height: 100)
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
            appleImageView.frame = CGRect(x: 232, y: 47, width: 35, height: 35)
            appleImageView.image = UIImage(named: "Apple.png")
            appleImageView.alpha = 0
        }
    }
    
    var titleLabel: UILabel! {
        didSet {
            titleLabel.frame = CGRect(x: 20, y: 45, width: 260, height: 50)
            titleLabel.layer.borderWidth = 2
            titleLabel.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            titleLabel.layer.cornerRadius = 8
            titleLabel.layer.masksToBounds = true
            titleLabel.text = " WWDC2018"
            titleLabel.textColor = UIColor.black
            titleLabel.font = UIFont(name: "AppleSDGothicNeo-Light" , size: 40)
            titleLabel.alpha = 0
        }
    }
    
    var welcomeLabel: UILabel! {
        didSet {
            welcomeLabel.frame = CGRect(x: 40, y: 260, width: 260, height: 60)
            welcomeLabel.lineBreakMode = .byWordWrapping
            welcomeLabel.numberOfLines = 3
            welcomeLabel.text = "Hello there, my name is Aleksey!\nThis is my WWDC2018 submition."
            welcomeLabel.textColor = UIColor.white
            welcomeLabel.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 16)
            welcomeLabel.alpha = 0
        }
    }
    
    var shapeLayer: CAShapeLayer! {
        didSet {
            let color = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
            shapeLayer.lineWidth = 5
            shapeLayer.lineCap = "round"
            shapeLayer.fillColor = nil
            shapeLayer.strokeEnd = 1
            shapeLayer.strokeColor = color
        }
    }
    
    var overShapeLayer: CAShapeLayer! {
        didSet {
            let color = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
            overShapeLayer.lineWidth = 5
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
        gradient.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
        setupShapeLayer(overShapeLayer)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        shapeLayer = CAShapeLayer()
        overShapeLayer = CAShapeLayer()
        appleImageView = UIImageView()
        myPhotoImageView = UIImageView()
        welcomeLabel = UILabel()
        titleLabel = UILabel()
        
        view.layer.insertSublayer(gradient, at: 0)
        view.layer.addSublayer(shapeLayer)
        view.layer.addSublayer(overShapeLayer)
        
        view.addSubview(appleImageView)
        view.addSubview(myPhotoImageView)
        view.addSubview(welcomeLabel)
        view.addSubview(titleLabel)
        
        performBluring()
        animateItems()
    }
    
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        let nextViewController = MainViewController()
        self.present(nextViewController, animated: true, completion: nil)
        
    }
    
    func animateItems() {
        UIView.animate(withDuration: 1.5, animations: {
            self.titleLabel.alpha = 0.5
            self.appleImageView.alpha = 0.5
        }, completion: {
            (Completed: Bool) -> Void in
            UIView.animate(withDuration: 1.5, delay: 1.0, options: UIViewAnimationOptions.curveLinear, animations: {
                self.myPhotoImageView.alpha = 1
            }, completion: {
                (Completed: Bool) -> Void in
                UIView.animate(withDuration: 1.5, delay: 1.0, options: UIViewAnimationOptions.curveLinear, animations: {
                    self.welcomeLabel.alpha = 1
                }, completion: {
                    (Completed: Bool) -> Void in
                    UIView.animate(withDuration: 1.5, delay: 3.0, options: UIViewAnimationOptions.curveLinear, animations: {
                        self.setupShapeLayer(self.shapeLayer)
                    }, completion: {
                        (Completed: Bool) -> Void in
                        UIView.animate(withDuration: 2.0, delay: 1.0, options: UIViewAnimationOptions.curveLinear, animations: {
                            self.performLoading()
                        }, completion: {
                            (Completed: Bool) -> Void in
                            return
                        })
                    })
                })
            })
        })
    }
    
    func performLoading() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 4
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.fillMode = kCAFillModeBoth
        animation.isRemovedOnCompletion = false
        animation.delegate = self
        self.overShapeLayer.add(animation, forKey: nil)
    }
}
