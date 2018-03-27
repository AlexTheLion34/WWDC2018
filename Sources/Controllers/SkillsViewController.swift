import UIKit

public class SkillsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    lazy var gradient = setGradientLayer()
    private let exitButton = UIButton(type: .system)
    private let myLanguages = ["Swift", "C/C++", "Java", "Python"]
    private let imagesOfLanguages = ["Swift.png", "C++.png", "Java.png", "Python.png"]
    
    private var table: UITableView! {
        didSet {
            table.frame = CGRect(x: 50, y: 100, width: 200, height: 300)
            table.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
            table.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
            table.layer.shadowOffset = CGSize(width: 0, height: 5)
            table.layer.shadowOpacity = 1
            table.delegate = self
            table.dataSource = self
            table.layer.shadowRadius = 5
            table.layer.borderWidth = 1
            table.layer.borderColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            table.layer.masksToBounds = false
            table.layer.cornerRadius = 10
            table.alpha = 0.6
            table.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            table.rowHeight = 75.0
        }
    }
    
    public override func viewDidLayoutSubviews() {
        gradient.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        table = UITableView()
        exitButton.setupExitButton()
        exitButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        view.layer.insertSublayer(gradient, at: 0)
        view.addSubview(exitButton)
        view.addSubview(table)
        performBluring()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        animateTable()
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myLanguages.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.setUpTableViewCell()
        let languageLabel = UILabel()
        languageLabel.setupLanguageLabel(withText: myLanguages[indexPath.row])
        let languageImageView = UIImageView()
        languageImageView.setupLanguageImageView(withImage: imagesOfLanguages[indexPath.row])
        cell.addSubview(languageImageView)
        cell.addSubview(languageLabel)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    public func animateTable() {
        table.reloadData()
        let cells = table.visibleCells
        let tableHeight = table.bounds.size.height
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        var delayCounter = 0.0
        for cell in cells {
            UIView.animate(withDuration: 2.0, delay: delayCounter * 0.1, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 1
        }
    }
}
