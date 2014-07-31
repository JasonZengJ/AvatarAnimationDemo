//
//  UIView+Extension.swift
//  AvatarAnimationDemo
//
//  Created by jason on 7/27/14.
//  Copyright (c) 2014 jason. All rights reserved.
//

extension UIView {
    
    class func navigationBounds() -> CGRect {
        
        return CGRectMake(0, 49, ScreenWidth, ScreenHeight - 49)
    }
    
    func top() -> CGFloat {
        
        return CGRectGetMinY(self.frame);
    }
    
    func bottom() -> CGFloat {
        
        return CGRectGetMaxY(self.frame);
    }
    
    func left() -> CGFloat {
        
        return CGRectGetMinX(self.frame);
    }
    
    func right() -> CGFloat {
        
        return CGRectGetMaxX(self.frame);
    }
    
    func height() -> CGFloat {
        
        return CGRectGetHeight(self.frame);
    }
    
    func width() -> CGFloat {
        
        return CGRectGetWidth(self.frame);
    }
}