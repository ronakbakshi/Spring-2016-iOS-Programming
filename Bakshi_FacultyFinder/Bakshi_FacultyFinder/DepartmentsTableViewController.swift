//
//  DepartmentsTableViewController.swift
//  Bakshi_FacultyFinder
//
//  Created by Bakshi,Ronak on 3/10/16.
//  Copyright © 2016 Bakshi,Ronak. All rights reserved.
//

import Foundation
import UIKit

class DepartmentsTableViewController : UITableViewController{
    var university:University!
    override func viewDidLoad() {
        university = University()
        self.title = "Departments"
        university.populateUniversity()
        NSNotificationCenter.defaultCenter().addObserver(self, selector:
            Selector("reloadData:"), name: "Data Delivered", object: nil)
    }
    func reloadData(notification:NSNotification){
        tableView.reloadData()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if university.departments == nil{
            return 0
        }else{
            return university.departments.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("department_cell")!
        cell.textLabel?.text = university.departments[indexPath.row].name
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueID"{
            if let fTVC:FacultyTableViewController = segue.destinationViewController as? FacultyTableViewController{
                if let comingView = tableView.indexPathForSelectedRow?.row{
                    fTVC.department = university.departments[comingView]
                    print(fTVC.department.name)
                    print("Hai")
                }
            }
        }
        
    }
    
}