//
//  UIColor+Extension.swift
//  GridPanelDemo
//
//  Created by jason on 6/19/14.
//  Copyright (c) 2014 jason. All rights reserved.
//

extension UIColor {
    
   convenience init(hex:uint,alpha:CGFloat) {
    
        let blue  = CGFloat(Int(hex & 0x0000FF)) / 255.0
        let green = CGFloat(Int((hex & 0x00FF00) >> 8)) / 255.0
        let red   = CGFloat(Int((hex & 0xFF0000) >> 16)) / 255.0
    
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    
    }
    
    
}