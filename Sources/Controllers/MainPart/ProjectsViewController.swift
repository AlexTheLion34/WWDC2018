import UIKit

public class ProjectsViewController: UIViewController {
    
    lazy var gradient = setGradientLayer()
    lazy var additionalView = setAdditionalView()
    private let exitButton = UIButton(type: .system)
    private let visualeffectView = UIVisualEffectView()
    private let introductionLabel = UILabel()
    private let appLabel = UILabel()
    private let appButton = UIButton(type: .system)
    private let additionalViewExitButton = UIButton(type: .system)
    private let exitAdditionalViewButton = UIButton(type: .system)
    private let imageView = UIImageView()
    private let segmentedControll = UISegmentedControl(items: ["1", "2", "3", "4"])
    
    public override func viewDidLayoutSubviews() {
        gradient.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        introductionLabel.setupProjectsControllerIntroductionLabel()
        appLabel.setupProjectsControllerAppLabel()
        appButton.setupProjectsControllerAppButton()
        visualeffectView.setupVisualEffectView()
        visualeffectView.isHidden = true
        exitAdditionalViewButton.setupPopUpExitButton()
        exitAdditionalViewButton.addTarget(self, action: #selector(additionalViewTapped), for: .touchUpInside)
        exitButton.setupExitButton()
        exitButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        appButton.addTarget(self, action: #selector(appButtonTapped), for: .touchUpInside)
        view.layer.insertSublayer(gradient, at: 0)
        view.addSubview(exitButton)
        view.addSubview(introductionLabel)
        view.addSubview(appButton)
        view.addSubview(appLabel)
        view.addSubview(visualeffectView)
        performBluring()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1.0, animations: {
            self.appButton.frame.origin.x -= 200
            self.appLabel.frame.origin.x -= 200
            self.introductionLabel.alpha = 1
        }, completion: nil)
    }
    
    @objc private func appButtonTapped() {
        exitAdditionalViewButton.frame = CGRect(x: 115, y: 425, width: 30, height: 30)
        additionalView.addSubview(exitAdditionalViewButton)
        imageView.setupAdditinalImageView(withImage: "First.png")
        segmentedControll.selectedSegmentIndex = 0
        segmentedControll.setupSegmentedControll()
        segmentedControll.addTarget(self, action: #selector(segmentedControllDidChanged), for: .valueChanged)
        additionalView.addSubview(imageView)
        additionalView.addSubview(segmentedControll)
        self.view.addSubview(additionalView)
        additionalView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        UIView.animate(withDuration: 0.4, animations: {
            self.visualeffectView.isHidden = false
            self.additionalView.alpha = 0.8
            self.additionalView.transform = CGAffineTransform.identity
        })
    }
    
    @objc private func segmentedControllDidChanged() {
        switch segmentedControll.selectedSegmentIndex {
        case 0:
            imageView.image = UIImage(named: "First.png")
        case 1:
            imageView.image = UIImage(named: "Second.png")
        case 2:
            imageView.image = UIImage(named: "Third.png")
        default:
            imageView.image = UIImage(named: "Fourth.png")
        }
    }
    
    @objc private func additionalViewTapped() {
        UIView.animate(withDuration: 0.4, animations: {
            self.additionalView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.additionalView.alpha = 0
            self.visualeffectView.isHidden = true
        }) { (success: Bool) in
            self.additionalView.removeFromSuperview()
        }
    }
}
