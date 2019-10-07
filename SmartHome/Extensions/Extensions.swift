import Foundation
import UIKit

extension UIView {
    func setCornerRadius(radius : CGFloat) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = radius
    }
}

extension UIColor {
    fileprivate static func rgba(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
    
    fileprivate static func rgb(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> UIColor {
        return rgba(r, g, b, 1.0)
    }
    
    // MARK: Public
    static let textFieldBC = rgb(216, 216, 216)
    static let greenBtn = rgb(0, 230, 118)
    
}

class LeftPaddedTextField : UITextField {
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 24, y: bounds.origin.y, width: bounds.width + 15, height: bounds.height)
        
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 24, y: bounds.origin.y, width: bounds.width + 15, height: bounds.height)
    }
}



