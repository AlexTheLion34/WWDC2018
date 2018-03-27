import UIKit

public class FirstViewController: UIViewController, CAAnimationDelegate {
    
    lazy var gradient = setGradientLayer()
    let titleLabel = UILabel()
    let welcomeLabel = UILabel()
    let myPhotoImageView = UIImageView()
    let shapeLayer = CAShapeLayer()
    let overShapeLayer = CAShapeLayer()
    
    func setupShapeLayer(_ shapeLayer: CAShapeLayer) {
        shapeLayer.frame = view.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(x: self.view.frame.width / 2 - 100, y: self.view.frame.height / 4 + 265))
        path.addLine(to: CGPoint(x: self.view.frame.width / 2 + 100, y: self.view.frame.height / 4 + 265))
        shapeLayer.path = path.cgPath
    }
    
    public override func viewDidLayoutSubviews() {
        gradient.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
        setupShapeLayer(overShapeLayer)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        shapeLayer.setupShapeLayer()
        overShapeLayer.setupOverShapeLayer()
        myPhotoImageView.setupMyPhoto()
        welcomeLabel.setupFirstControllerWelcomeLabel()
        titleLabel.setupFirstControllerTitleLabel()
        
        view.layer.insertSublayer(gradient, at: 0)
        view.layer.addSublayer(shapeLayer)
        view.layer.addSublayer(overShapeLayer)
        
        view.addSubview(myPhotoImageView)
        view.addSubview(welcomeLabel)
        view.addSubview(titleLabel)
        
        performBluring()
        animateItems()
    }
    
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        let nextViewController = MainViewController()
        nextViewController.modalTransitionStyle = .crossDissolve
        self.present(nextViewController, animated: true, completion: nil)
        playMusic()
    }
    
    func animateItems() {
        UIView.animate(withDuration: 1.5, animations: {
            self.titleLabel.alpha = 1.0
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
