//
//  ViewController.swift
//  AvatarAnimationDemo
//
//  Created by jason on 7/27/14.
//  Copyright (c) 2014 jason. All rights reserved.
//

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableView:UITableView!
    var tableViewHeaderImageView:UIImageView!
    var scrolledY:CGFloat!
    var tableHeaderImageViewHeight:CGFloat!
    
    
    init(coder aDecoder: NSCoder!)  {
        super.init(coder: aDecoder)
    }
    
    init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        
        super.init(nibName: nibName, bundle: nibBundle)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "AvatarAnimation"
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationController.navigationBar.barTintColor = UIColor(hex: 0x29C1E8, alpha: 1.0)
        self.navigationController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        
        var tableView = UITableView(frame: self.view.frame, style: UITableViewStyle.Plain)
        tableView.delegate   = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.clearColor()
        
        var imageView:UIImageView = UIImageView(image: UIImage(named:"demo1"))
        imageView.frame           = CGRectMake(0, 0,CGFloat(imageView.width() / 2.0), CGFloat(imageView.height() / 2.0))
        imageView.contentMode     = UIViewContentMode.ScaleAspectFill;
        imageView.clipsToBounds   = true
        
        var tableHeaderView:UIView = UIView(frame: CGRectMake(0, 0, self.view.width(), imageView.height()))
        tableHeaderView.addSubview(imageView)
        
        self.tableView                  = tableView
        self.tableViewHeaderImageView   = imageView
        self.tableHeaderImageViewHeight = imageView.height()
        self.tableView.tableHeaderView  = tableHeaderView;
        
        self.view.addSubview(tableView)
        
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        
        return 1;
    }
    
    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat
    {
        return 70
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        
        return 12;
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
     
        let identifier = "identifier"
        var cell:PropTableViewCell = PropTableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: identifier)
        
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        var cell:PropTableViewCell = tableView.cellForRowAtIndexPath(indexPath) as PropTableViewCell
        cell.scrolledY = self.scrolledY
        
        var infoViewController:InfoViewController = InfoViewController(nibName: "", bundle: nil)
        infoViewController.propTableViewCell      = cell
        
        cell.animateToInfoViewController()
        self.navigationController.pushViewController(infoViewController, animated: true)
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        
        self.scrolledY   = scrollView.contentOffset.y + 64
        var yPos:CGFloat = -scrollView.contentOffset.y
        
        if yPos > 64 {
            
            var tableViewHeaderImageViewFrame:CGRect  = self.tableViewHeaderImageView.frame
            tableViewHeaderImageViewFrame.origin.y    = self.scrolledY
            tableViewHeaderImageViewFrame.size.height = self.tableHeaderImageViewHeight + yPos - 64
            self.tableViewHeaderImageView.frame       = tableViewHeaderImageViewFrame
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
}








