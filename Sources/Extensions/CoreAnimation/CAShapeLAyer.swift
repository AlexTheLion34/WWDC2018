import UIKit

extension CAShapeLayer {
    
    public func setupShapeLayer() {
        let color = Design.secondMainColor.cgColor
        self.lineWidth = 5
        self.lineCap = "round"
        self.fillColor = nil
        self.strokeEnd = 1
        self.strokeColor = color
    }
    
    public func setupOverShapeLayer() {
        let color = Design.firstMainColor.cgColor
        self.lineWidth = 5
        self.lineCap = "round"
        self.fillColor = nil
        self.strokeEnd = 0
        self.strokeColor = color
    }
    
}
