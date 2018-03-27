import UIKit

extension CAShapeLayer {
    
    public func setupShapeLayer() {
        let color = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        self.lineWidth = 5
        self.lineCap = "round"
        self.fillColor = nil
        self.strokeEnd = 1
        self.strokeColor = color
    }
    
    public func setupOverShapeLayer() {
        let color = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1).cgColor
        self.lineWidth = 5
        self.lineCap = "round"
        self.fillColor = nil
        self.strokeEnd = 0
        self.strokeColor = color
    }
    
}
