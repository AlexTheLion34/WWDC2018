import UIKit

public class FinishViewController: UIViewController {
    
    lazy var gradient = setGradientLayer()
    lazy var finishGradient = setFinishLayer()
    private let thanksLabel = UILabel()
    private let turningOffLabel = UILabel()
    
    private var activityIndicator: UIActivityIndicatorView! {
        didSet {
            activityIndicator.frame = CGRect(x: 140, y: 365, width: 20, height: 20)
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.white
        }
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradient.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Design.secondMainColor
        turningOffLabel.setupTurningOffLabel()
        activityIndicator = UIActivityIndicatorView()
        thanksLabel.setupThanksLabel()
        view.layer.insertSublayer(gradient, at: 0)
        view.addSubview(thanksLabel)
        view.addSubview(activityIndicator)
        view.addSubview(turningOffLabel)
        performBluring()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1.5, animations: {
            self.thanksLabel.alpha = 1
        }, completion: {
            (Completed: Bool) -> Void in
            UIView.animate(withDuration: 4.0, delay: 1.5, options: UIViewAnimationOptions.curveLinear, animations: {
                self.activityIndicator.startAnimating()
                self.turningOffLabel.alpha = 1
            }, completion: {
                (Completed: Bool) -> Void in
                UIView.animate(withDuration: 4.0, delay: 1.5, options: UIViewAnimationOptions.curveLinear, animations: {
                    self.thanksLabel.alpha = 0
                    self.turningOffLabel.alpha = 0
                }, completion: {
                    (Completed: Bool) -> Void in
                    stopMusic()
                    self.activityIndicator.stopAnimating()
                    self.view.layer.sublayers![0].removeFromSuperlayer()
                    self.view.layer.insertSublayer(self.finishGradient, at: 0)
                })
            })
        })
    }
}

