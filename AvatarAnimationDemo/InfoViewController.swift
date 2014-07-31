//
//  InfoViewController.swift
//  AvatarAnimationDemo
//
//  Created by jason on 7/31/14.
//  Copyright (c) 2014 jason. All rights reserved.
//


class InfoViewController : UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var propTableViewCell:PropTableViewCell!
    var tableHeaderImageView:UIImageView!
    var tableHeaderImageViewHeight:CGFloat!
    var tableView:    UITableView!
    var titleView:    UIView!
    var titleLabel:   UILabel!
    var canPopBack:   Bool!
    var subTitleLabel:UILabel!
    var tableHeaderView:UIView!
    var avatarImageView:UIImageView!
    
    init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibName, bundle: nibBundleOrNil)
    }
    
    
    override func viewDidLoad() {
        
        self.title = "Jason Info"
        self.navigationController.navigationBar.tintColor = UIColor.whiteColor();
        
        var leftNavigationbarButtonItem:UIBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: self, action: "doBack")
        leftNavigationbarButtonItem.image = UIImage(named: "back_white")
        
        self.navigationItem.leftBarButtonItem = leftNavigationbarButtonItem
        self.canPopBack = false
        
        var tableView = UITableView(frame: self.view.frame, style: UITableViewStyle.Plain)
        tableView.delegate        = self
        tableView.dataSource      = self
        tableView.separatorStyle  = UITableViewCellSeparatorStyle.None
        tableView.backgroundColor = UIColor.whiteColor()
        
        var headerImage:UIImage = UIImage(named: "demo2").blurImageWithRadius(0.3)
        var tableHeaderImageView:UIImageView = UIImageView(image:headerImage)
        tableHeaderImageView.frame           = CGRectMake(0, 0, tableHeaderImageView.width(), tableHeaderImageView.height())
        tableHeaderImageView.contentMode     = UIViewContentMode.ScaleAspectFill
        tableHeaderImageView.clipsToBounds   = true
        
        var tableHeaderView:UIView = UIView(frame: CGRectMake(0, 0, self.view.width(), tableHeaderImageView.height()))
        tableHeaderView.addSubview(tableHeaderImageView)
        
        var titleView:UIView      = UIView(frame: tableHeaderView.frame)
        titleView.backgroundColor = UIColor(hex: 0x000000, alpha: 0.6)
        tableHeaderView.addSubview(titleView)
        
        var titleLabel:UILabel    = self.labelWithFont(UIFont.systemFontOfSize(30), text: "Jason", frame: CGRectMake(0, 100, self.view.width(), 50))
        var subTitleLabel:UILabel = self.labelWithFont(UIFont.systemFontOfSize(15), text: "A developer and designer XD", frame: CGRectMake(0, titleLabel.bottom(), self.view.width(), 20))
        
        var avatarImageView:UIImageView = UIImageView(frame: CGRectMake((self.view.width() - 50) / 2, tableHeaderView.height() - 25, 50, 50))
        avatarImageView.image = UIImage(named: "cutmypic")
        
        self.tableView                  = tableView
        self.titleView                  = titleView
        self.titleLabel                 = titleLabel
        self.subTitleLabel              = subTitleLabel
        self.avatarImageView            = avatarImageView
        self.tableHeaderView            = tableHeaderView
        self.tableHeaderImageView       = tableHeaderImageView
        self.tableView.tableHeaderView  = tableHeaderView
        self.tableHeaderImageViewHeight = tableHeaderImageView.height()
        
        self.view.addSubview(tableView)
        self.view.addSubview(titleLabel)
        self.view.addSubview(subTitleLabel)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        var delayTime:dispatch_time_t             = dispatch_time(DISPATCH_TIME_NOW, 25 * Int64(NSEC_PER_SEC) / 100)
        var infoViewController:InfoViewController = self
        dispatch_after(delayTime, dispatch_get_main_queue(), { () -> Void in
            
            infoViewController.tableHeaderView.addSubview(infoViewController.avatarImageView)
            infoViewController.canPopBack = true;
            
        })
        
    }
    
    func doBack() {
        
        if !self.canPopBack {
            return
        }
        self.avatarImageView.removeFromSuperview()
        self.propTableViewCell.animateBackViewController()
        self.navigationController.popViewControllerAnimated(true)
        
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        
        return 70
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        var cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "")
        var line:UIView      = UIView(frame: CGRectMake(10, cell.height(), cell.width() - 20, 0.5))
        
        line.backgroundColor = UIColor(hex: 0xB822DD, alpha: 1.0)
        cell.selectionStyle  = UITableViewCellSelectionStyle.None
        cell.addSubview(line)
        
        return cell
    }

    func scrollViewDidScroll(scrollView: UIScrollView!) {
        
        var yPos:CGFloat = -scrollView.contentOffset.y;
        
        if yPos > 64 {
            
            var tableHeaderImageViewFrame:CGRect  = self.tableHeaderImageView.frame
            tableHeaderImageViewFrame.origin.y    = scrollView.contentOffset.y + 64
            tableHeaderImageViewFrame.size.height = self.tableHeaderImageViewHeight + yPos - 64
            
            self.tableHeaderImageView.frame   = tableHeaderImageViewFrame
            self.titleView.frame              = tableHeaderImageViewFrame
            
        }
        
        var k:CGFloat = 1;
        if yPos > 64 && yPos <= 164 {
            
            k = 1.0 - 0.01 * (yPos - 64)
            self.titleLabel.alpha    = k;
            self.subTitleLabel.alpha = k;
            
        } else if yPos < 64 && yPos >= 14 {
            
            k = 1.0 - 0.02 * (-(yPos - 64))
            self.titleLabel.alpha    = k;
            self.subTitleLabel.alpha = k;
            
        }
        
    }
    
    func labelWithFont(font:UIFont , text:NSString , frame:CGRect ) -> UILabel {
        
        var label:UILabel     = UILabel(frame: frame)
        label.text            = text
        label.font            = font
        label.textColor       = UIColor.whiteColor()
        label.textAlignment   = NSTextAlignment.Center
        label.backgroundColor = UIColor.clearColor()
        
        return label
    }
    
}








