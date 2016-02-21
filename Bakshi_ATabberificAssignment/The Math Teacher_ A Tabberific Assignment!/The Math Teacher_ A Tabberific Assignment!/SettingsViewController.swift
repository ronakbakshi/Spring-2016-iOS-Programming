//
//  ThirdViewController.swift
//  The Math Teacher: A Tabberific Assignment!
//  @Author: S524975
//  Created by Bakshi,Ronak on 2/9/16.
//  Copyright © 2016 Bakshi,Ronak. All rights reserved.
//
//  This application is suitable to work for iPhone 6s Plus
import UIKit
class SettingsViewController : UIViewController {
    var mathTeacher:MathTeacher!
    
    @IBOutlet weak var maximumProblemSizeTF: UITextField!
    
    
    @IBOutlet weak var operationSC: UISegmentedControl!
    
    //contains the logic for making s=the selected segment to highlight in green color
    @IBAction func operationActionSC(sender: AnyObject) {
        let problemsVC = (self.tabBarController?.viewControllers![0] as! ProblemsViewController)
        let sortedViews = sender.subviews.sort( { $0.frame.origin.x < $1.frame.origin.x } )
        
        for (index, view) in sortedViews.enumerate() {
            if index == sender.selectedSegmentIndex {
                view.tintColor = UIColor.greenColor()
                
            }
        }
        if operationSC.selectedSegmentIndex == 0{
            problemsVC.operatorLBL.text = "+"
            mathTeacher.operation = OperationType.Plus
        }
        if operationSC.selectedSegmentIndex == 1{
            problemsVC.operatorLBL.text = "-"
            mathTeacher.operation = OperationType.Minus
        }
    }
    
    override func viewDidLoad() {
        mathTeacher = (UIApplication.sharedApplication().delegate as! AppDelegate).mathTeacher
//        mathTeacher.maximumProblemSize = Int(maximumProblemSizeTF.text!)!
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}