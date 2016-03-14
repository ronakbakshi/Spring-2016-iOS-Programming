//
//  FacultyTableViewController.swift
//  Bakshi_FacultyFinder
//
//  Created by Bakshi,Ronak on 3/10/16.
//  Copyright © 2016 Bakshi,Ronak. All rights reserved.
//

import Foundation
import UIKit

class FacultyTableViewController:UITableViewController{
    var department : Department!
    override func viewDidLoad() {
        self.navigationItem.title = department.name
    }

    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return department.faculty.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("professor_cell")!
        cell.textLabel?.text = department.faculty[indexPath.row].lastName
        cell.detailTextLabel?.text = department.faculty[indexPath.row].firstName
        return cell
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segue2ID"{
            if let pVC:ProfessorInfoViewController = segue.destinationViewController as? ProfessorInfoViewController{
                if let comingView = tableView.indexPathForSelectedRow?.row{
                    pVC.professor = department.faculty[comingView]
                }
            }
        }
        
    }
}
