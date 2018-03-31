import UIKit

public class AboutMeViewController: UIViewController, UIScrollViewDelegate {
    
    lazy var gradient = setGradientLayer()
    lazy var newView = setPopView()
    private let exitButton = UIButton(type: .system)
    lazy var scView = newView.subviews[0] as! UIScrollView
    
    var pageControll: UIPageControl! {
        didSet {
            pageControll.frame = CGRect(x: 150, y: 462.5, width: 30, height: 10)
            pageControll.currentPageIndicatorTintColor = Design.firstMainColor
            pageControll.numberOfPages = 3
            pageControll.pageIndicatorTintColor = Design.secondMainColor
            pageControll.alpha = 0
        }
    }
    
    public override func viewDidLayoutSubviews() {
        gradient.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        exitButton.setupExitButton()
        exitButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        view.addSubview(exitButton)
        view.layer.insertSublayer(gradient, at: 0)
        setupPages()
        performBluring()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        UIView.animate(withDuration: 1.0, animations: {
            self.newView.frame.origin.x -= 285
            self.pageControll.alpha = 1
        })
    }
    
    func setupPages() {
        pageControll = UIPageControl()
        newView.alpha = 0.8
        newView.frame = CGRect(x: 310, y: 55, width: 250, height: 390)
        let scView = newView.subviews[0] as! UIScrollView
        scView.delegate = self
        scView.frame = CGRect(x: 5, y: 5, width: 240, height: 380)
        scView.showsHorizontalScrollIndicator = false
        scView.isPagingEnabled = true
        var contentWidth: CGFloat = 0.0
        for num in 0...2 {
            let additionalScroll = UIScrollView()
            let headingLabel = UILabel()
            let textLabel = UILabel()
            let imageToDisplay = UIImage(named: "\(num).png")
            let imageView = UIImageView(image: imageToDisplay)
            headingLabel.setupAboutMeControllerHeadingLabel()
            textLabel.setupAboutMeControllerTextLabel()
            switch num {
            case 0:
                headingLabel.text = "Myself"
                textLabel.text = readFromFile(withName: "Myself")
                additionalScroll.contentSize = CGSize(width: 230, height: 365)
                textLabel.frame = CGRect(x: 5, y: 5, width: 220, height: 355)
            case 1:
                headingLabel.text = "Education"
                textLabel.text = readFromFile(withName: "Education")
                additionalScroll.contentSize = CGSize(width: 230, height: 350)
                textLabel.frame = CGRect(x: 5, y: 5, width: 220, height: 355)
            default:
                headingLabel.text = "Why Apple?"
                textLabel.text = readFromFile(withName: "WhyApple?")
                additionalScroll.contentSize = CGSize(width: 230, height: 290)
                textLabel.frame = CGRect(x: 5, y: 5, width: 220, height: 290)
            }
            imageView.layer.cornerRadius = 10
            imageView.layer.masksToBounds = true
            let xCoordinate = 5 + scView.frame.width * CGFloat(num)
            contentWidth += scView.frame.width
            scView.addSubview(imageView)
            scView.addSubview(headingLabel)
            scView.addSubview(additionalScroll)
            additionalScroll.addSubview(textLabel)
            imageView.frame = CGRect(x: xCoordinate, y: 30, width: 230, height: 150)
            headingLabel.frame = CGRect(x: xCoordinate + 65, y: 5, width: 100, height: 20)
            additionalScroll.frame = CGRect(x: xCoordinate, y: 185, width: 230, height: 190)
        }
        scView.contentSize = CGSize(width: contentWidth, height: scView.frame.height)
        newView.addSubview(scView)
        self.view.addSubview(newView)
        self.view.addSubview(pageControll)
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControll.currentPage = Int(scView.contentOffset.x / CGFloat(230))
    }
    
}
