import UIKit

public class AboutMeViewController: UIViewController {
    
    lazy var gradient = setGradientLayer()
    private let exitButton = UIButton(type: .system)
    
    var scrollView: UIScrollView! {
        didSet {
            scrollView.frame = CGRect(x: 50, y: 150, width: 200, height: 250)
            scrollView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            scrollView.alpha = 0.6
            scrollView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
            scrollView.layer.shadowOffset = CGSize(width: 0, height: 5)
            scrollView.layer.shadowOpacity = 1
            scrollView.layer.shadowRadius = 5
            scrollView.layer.masksToBounds = false
            scrollView.layer.cornerRadius = 10
        }
    }
    
    var textLabel: UILabel! {
        didSet {
            textLabel.frame = CGRect(x: 2, y: 2, width: 196, height: 300)
            textLabel.layer.cornerRadius = 10
            textLabel.lineBreakMode = .byWordWrapping
            textLabel.numberOfLines = 50
            textLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            textLabel.text = ""
        }
    }
    
    public override func viewDidLayoutSubviews() {
        gradient.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        scrollView = UIScrollView()
        textLabel = UILabel()
        exitButton.setupExitButton()
        exitButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        scrollView.addSubview(textLabel)
        scrollView.contentSize = CGSize(width: 200, height: 300)
        view.addSubview(scrollView)
        view.addSubview(exitButton)
        view.layer.insertSublayer(gradient, at: 0)
        performBluring()
    }
}
