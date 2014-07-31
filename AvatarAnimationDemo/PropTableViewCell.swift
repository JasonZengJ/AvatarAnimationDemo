//
//  PropTableViewCell.swift
//  AvatarAnimationDemo
//
//  Created by jason on 7/31/14.
//  Copyright (c) 2014 jason. All rights reserved.
//

class PropTableViewCell : UITableViewCell {
    
    var avatarImageView:UIImageView!
    var scrolledY:CGFloat!
    var avatarWindow:UIWindow!
    var avatarWindowFrame:CGRect!
    
    init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initView()
    }
    
    func initView() {
        
        var nameLabel:UILabel     = UILabel(frame: CGRectMake(70, 10, ScreenWidth - 100, 20))
        nameLabel.text            = "Jason"
        nameLabel.font            = UIFont.systemFontOfSize(17)
        nameLabel.textColor       = UIColor(hex: 0x17A4C7, alpha: 1.0)
        nameLabel.backgroundColor = UIColor.clearColor()
        
        var detailsLabel:UILabel     = UILabel(frame: CGRectMake(70, nameLabel.bottom(), ScreenWidth - 100, 30))
        detailsLabel.text            = "A developer and designer XD"
        detailsLabel.font            = UIFont.systemFontOfSize(14)
        detailsLabel.backgroundColor = UIColor.clearColor()
        
        var avatarImageView:UIImageView = UIImageView(frame: CGRectMake(10, 10, 50, 50))
        avatarImageView.image = UIImage(named: "cutmypic")
        avatarImageView.backgroundColor = UIColor.clearColor()
        
        self.avatarImageView  = avatarImageView
        self.addSubview(nameLabel)
        self.addSubview(detailsLabel)
        self.addSubview(avatarImageView)
        
        
    }
    
    func animateToInfoViewController() {
     
        var frame:CGRect = self.frame
        frame.origin.y   = self.top() + 64 - self.scrolledY
        
        var avatarWindow:UIWindow    = UIWindow(frame: frame)
        avatarWindow.hidden          = false
        avatarWindow.windowLevel     = UIWindowLevelStatusBar + 1
        avatarWindow.backgroundColor = UIColor.clearColor()
        self.avatarWindow = avatarWindow
        self.avatarImageView.removeFromSuperview()
        avatarWindow.addSubview(self.avatarImageView)
        
        var propTableViewCell:PropTableViewCell = self;
    
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            
            propTableViewCell.avatarImageView.frame = CGRectMake((self.width() - 50) / 2, 10, 50, 50)
            
        })
        
        UIView.animateWithDuration(0.5, delay: 0.1, options: UIViewAnimationOptions.CurveEaseIn, animations: {() -> Void in
        
            avatarWindow.frame = CGRectMake(avatarWindow.left(), 209 - 30, self.width(), avatarWindow.height())
            
        }, completion: {(Bool finished) -> Void in
            
            var delayTime:dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, 2 * Int64(NSEC_PER_SEC) / 10)
            dispatch_after(delayTime, dispatch_get_main_queue(), { () -> Void in
                
                propTableViewCell.avatarWindow = nil
                
            })
        })
       
        self.avatarWindowFrame = avatarWindow.frame
    }
    
    func animateBackViewController() {
        
        var avatarWindow:UIWindow    = UIWindow(frame: self.avatarWindowFrame)
        avatarWindow.hidden          = false
        avatarWindow.windowLevel     = UIWindowLevelStatusBar + 1
        avatarWindow.backgroundColor = UIColor.clearColor()
        self.avatarWindow = avatarWindow
        self.avatarImageView.removeFromSuperview()
        avatarWindow.addSubview(self.avatarImageView)
        
        var propTableViewCell:PropTableViewCell = self;
        
        UIView.animateWithDuration(0.4, animations: { () -> Void in
        
            propTableViewCell.avatarImageView.frame = CGRectMake(10, 10, 50, 50)
            
        })
        
        UIView.animateWithDuration(0.5, delay: 0.2, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
        
            avatarWindow.frame = CGRectMake(self.left(), self.top() + 64 - self.scrolledY, self.width(), self.height())
            
        }, completion: { (Bool finished) -> Void in
            
            propTableViewCell.avatarWindow = nil
            propTableViewCell.addSubview(self.avatarImageView)
            
        })
        
    }
    
}








