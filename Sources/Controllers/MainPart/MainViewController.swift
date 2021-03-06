import UIKit

public class MainViewController: UIViewController {
    
    private var buttons = [UIButton]()
    private var labels = [UILabel]()
    private var buttonX = -100.0
    private var buttonY = 70.0
    private var labelX = -100.0
    private var labelY = 155.0
    private var loaded = false
    private let descriptionLabel = UILabel()
    private let endButtonLabel = UILabel()
    private let endButton = UIButton(type: .system)
    
    lazy var gradient = setGradientLayer()
    
    public override func viewDidLayoutSubviews() {
        gradient.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.insertSublayer(gradient, at: 0)
        descriptionLabel.setupMainControllerDescriptionLabel()
        endButton.setupEndButton()
        endButton.addTarget(self, action: #selector(endButtonAction), for: UIControlEvents.touchUpInside)
        endButtonLabel.setupEndButtonLabel()
        setButtons()
        setLabels()
        performBluring()
        for button in buttons {
            view.addSubview(button)
        }
        for label in labels {
            view.addSubview(label)
        }
        view.addSubview(descriptionLabel)
        view.addSubview(endButton)
        view.addSubview(endButtonLabel)
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1.0, animations: {
            self.buttons[0].frame.origin.x += 210
            self.labels[0].frame.origin.x += 210
            self.buttons[1].frame.origin.x += 120
            self.labels[1].frame.origin.x += 120
            self.buttons[2].frame.origin.x -= 200
            self.labels[2].frame.origin.x -= 200
            self.buttons[3].frame.origin.x -= 290
            self.labels[3].frame.origin.x -= 290
            self.descriptionLabel.frame.origin.x -= 550
            self.endButton.frame.origin.y -= 65
            self.endButtonLabel.frame.origin.x -= 55
        }, completion: {
            (Completed: Bool) -> Void in
            return
        })
    }
    
    private func setLabels() {
        for num in 0..<4 {
            let label = UILabel()
            label.setupLabelAppearence(x: labelX, y: labelY, width: 80.0, height: 25.0)
            switch num {
            case 0:
                label.text = "[About me]"
                labelY += 130
            case 1:
                label.text = "[Skills]"
                labelX += 500
            case 2:
                label.text = "[Hobbies]"
                labelY += 130
            default:
                label.text = "[Projects]"
            }
            labels.append(label)
        }
    }
    
    private func setButtons() {
        for num in 0..<4 {
            let button = UIButton(type: .system)
            button.setupMainControllerButtonAppearence(x: buttonX, y: buttonY, width: 80, height: 80)
            switch num {
            case 0:
                button.setImage(UIImage(named: "AboutMe.png"), for: .normal)
                button.addTarget(self, action: #selector(firstButtonAction), for: UIControlEvents.touchUpInside)
                buttonY += 130
            case 1:
                button.setImage(UIImage(named: "Skills.png"), for: .normal)
                button.addTarget(self, action: #selector(secondButtonAction), for: UIControlEvents.touchUpInside)
                buttonX += 500
            case 2:
                button.setImage(UIImage(named: "Hobbies.png"), for: .normal)
                button.addTarget(self, action: #selector(thirdButtonAction), for: UIControlEvents.touchUpInside)
                buttonY += 130
            default:
                button.setImage(UIImage(named: "Projects.png"), for: .normal)
                button.addTarget(self, action: #selector(fourthButtonAction), for: UIControlEvents.touchUpInside)
                break
            }
            buttons.append(button)
        }
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
        nextController.modalTransitionStyle = .crossDissolve
        present(nextController, animated: true, completion: nil)
    }
    
    @objc public func endButtonAction() {
        let nextController = FinishViewController()
        nextController.modalTransitionStyle = .crossDissolve
        present(nextController, animated: true, completion: nil)
    }
}
