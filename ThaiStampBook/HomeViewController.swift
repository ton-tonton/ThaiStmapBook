//
//  HomeViewController.swift
//  ThaiStampBook
//
//  Created by Tawatchai Sunarat on 6/29/15.
//  Copyright (c) 2015 ton. All rights reserved.
//

import UIKit

let year = ["1968", "1972", "1973", "1975", "1976", "1968", "1972", "1973", "1975", "1976", "1968", "1972", "1973", "1975", "1976"]
let NAVBAR_CHANGE_POINT: CGFloat = 8.0

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        self.navigationController?.navigationBar.lt_setBackgroundColor(UIColor.clearColor())
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        self.scrollViewDidScroll(self.tableView)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let color = UIColor(red: 0/255.0, green: 175/255.0, blue: 240/255.0, alpha: 1)
        let offsetY = scrollView.contentOffset.y
        let navigationBar = self.navigationController?.navigationBar
        
        if offsetY > NAVBAR_CHANGE_POINT {
            var alpha = 1 - ((NAVBAR_CHANGE_POINT + 64 - offsetY) / 64)
            navigationBar?.lt_setBackgroundColor(color.colorWithAlphaComponent(alpha))
            
        } else {
            navigationBar?.lt_setBackgroundColor(color.colorWithAlphaComponent(0))
        }
    }
    
    // MARK: - TableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return year.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as? UITableViewCell
        let row = indexPath.row
        cell?.textLabel?.text = year[row]
        return cell!
    }
    
    // MARK: - TableViewDelegate
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
