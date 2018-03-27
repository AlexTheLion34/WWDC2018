import UIKit

public class HobbiesViewController: UIViewController {
    
    lazy var gradient = setGradientLayer()
    lazy var popView = setPopView()
    private let visualEffectView = UIVisualEffectView()
    private var exitButton = UIButton(type: .system)
    private var popUpExitButton = UIButton(type: .system)
    private var buttons = [UIButton]()
    private var labels = [UILabel]()
    
    
    public override func viewDidLayoutSubviews() {
        gradient.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        visualEffectView.setupVisualEffectView()
        visualEffectView.isHidden = true
        exitButton.setupExitButton()
        popUpExitButton.setupPopUpExitButton()
        popUpExitButton.addTarget(self, action: #selector(popUpExitTapped), for: .touchUpInside)
        exitButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        setButtons()
        setLabels()
        
        for button in buttons {
            view.addSubview(button)
        }
        for label in labels {
            view.addSubview(label)
        }
        
        view.layer.insertSublayer(gradient, at: 0)
        view.addSubview(exitButton)
        view.addSubview(visualEffectView)
        
        performBluring()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1.0, animations: {
            self.buttons[0].frame.origin.x -= 110
            self.labels[0].frame.origin.x -= 110
            self.buttons[1].frame.origin.x += 210
            self.labels[1].frame.origin.x += 210
            self.buttons[2].frame.origin.x += 120
            self.labels[2].frame.origin.x += 120
        }, completion: nil)
    }
    
    func setButtons() {
        var x = 310.0
        var y = 50.0
        for num in 0..<3 {
            let button = UIButton(type: .system)
            button.setupHobbiesControllerButtonAppearence(x: x, y: y, width: 80.0, height: 80.0)
            switch num {
            case 0:
                button.setImage(UIImage(named: "Robotechnics.png"), for: .normal)
                button.addTarget(self, action: #selector(firstButtonTapped), for: .touchUpInside)
                x = -100.0
                y = 210.0
            case 1:
                button.setImage(UIImage(named: "Basketball.png"), for: .normal)
                button.addTarget(self, action: #selector(secondButtonTapped), for: .touchUpInside)
                x = -100.0
                y = 370.0
            default:
                button.setImage(UIImage(named: "Sneakers.png"), for: .normal)
                button.addTarget(self, action: #selector(thirdButtonTapped), for: .touchUpInside)
            }
            buttons.append(button)
        }
    }
    
    func setLabels() {
        var labelX = 310.0
        var labelY = 135.0
        for num in 0..<3 {
            let label = UILabel()
            label.setupLabelAppearence(x: labelX, y: labelY, width: 80.0, height: 25.0)
            switch num {
            case 0:
                label.text = "[Robots]"
                labelX = -100.0
                labelY = 295.0
            case 1:
                label.text = "[Basketball]"
                labelX = -100.0
                labelY = 455.0
            default:
                label.text = "[Sneakers]"
            }
            labels.append(label)
        }
    }
    
    @objc func firstButtonTapped() {
        self.view.addSubview(popView)
        popView.addSubview(popUpExitButton)
        let scView = popView.subviews[0] as! UIScrollView
        let bottomOffset = CGPoint(x: 0, y: 0)
        scView.setContentOffset(bottomOffset, animated: false)
        let imView = popView.subviews[0].subviews[1] as! UIImageView
        imView.image = UIImage(named: "EV3.png")
        let lbl = popView.subviews[0].subviews[0] as! UILabel
        lbl.text = readFromFile(withName: "EV3")
        lbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        popView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        UIView.animate(withDuration: 0.4, animations: {
            self.visualEffectView.isHidden = false
            self.popView.alpha = 0.8
            self.popView.transform = CGAffineTransform.identity
        })
    }
    
    @objc func secondButtonTapped() {
        self.view.addSubview(popView)
        popView.addSubview(popUpExitButton)
        let scView = popView.subviews[0] as! UIScrollView
        let bottomOffset = CGPoint(x: 0, y: 0)
        scView.setContentOffset(bottomOffset, animated: false)
        let imView = popView.subviews[0].subviews[1] as! UIImageView
        imView.image = UIImage(named: "NBA.png")
        popView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        UIView.animate(withDuration: 0.6, animations: {
            self.visualEffectView.isHidden = false
            self.popView.alpha = 0.8
            self.popView.transform = CGAffineTransform.identity
        })
    }
    
    @objc func thirdButtonTapped() {
        self.view.addSubview(popView)
        popView.addSubview(popUpExitButton)
        let scView = popView.subviews[0] as! UIScrollView
        let bottomOffset = CGPoint(x: 0, y: 0)
        scView.setContentOffset(bottomOffset, animated: false)
        let imView = popView.subviews[0].subviews[1] as! UIImageView
        imView.image = UIImage(named: "SneakersAir.png")
        popView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        UIView.animate(withDuration: 0.6, animations: {
            self.visualEffectView.isHidden = false
            self.popView.alpha = 0.8
            self.popView.transform = CGAffineTransform.identity
        })
    }
    
    @objc func popUpExitTapped() {
        UIView.animate(withDuration: 0.4, animations: {
            self.popView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.popView.alpha = 0
            self.visualEffectView.isHidden = true
        }) { (success: Bool) in
            self.popView.removeFromSuperview()
        }
    }
}
