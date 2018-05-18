//
//  Global.swift
//  Statistical Data Collection
//
//  Created by L&L Programming on 2/2/18.
//  Copyright © 2018 L&L Programming. All rights reserved.
//

import UIKit

@IBDesignable extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        set {layer.borderWidth = newValue}
        get {return layer.borderWidth}
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            //guard let uiColor = newValue else {return}
            layer.borderColor = newValue?.cgColor
        }
        get {
            guard let cgColor = layer.borderColor else {return nil}
            return UIColor(cgColor: cgColor)
        }
    }
}

@IBDesignable extension UILabel {
    
    @IBInspectable var borderWidth: CGFloat {
        set {layer.borderWidth = newValue}
        get {return layer.borderWidth}
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            //guard let uiColor = newValue else {return}
            layer.borderColor = newValue?.cgColor
        }
        get {
            guard let cgColor = layer.borderColor else {return nil}
            return UIColor(cgColor: cgColor)
        }
    }
}






