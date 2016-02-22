//
//  SecondViewController.swift
//  The Math Teacher: A Tabberific Assignment!
//  @Author: S524975
//  Created by Bakshi,Ronak on 2/9/16.
//  Copyright © 2016 Bakshi,Ronak. All rights reserved.
//
//  This application is suitable to work for iPhone 6s Plus

import UIKit

class HistoryViewController: UIViewController {
    var mathTeacher:MathTeacher!
    override func viewDidLoad() {
        mathTeacher = (UIApplication.sharedApplication().delegate as! AppDelegate).mathTeacher
       // mathTeacher.history = ""
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        historyTV.text = mathTeacher.history
    }

//    @IBOutlet weak var historyTV: UITextView!

    @IBOutlet weak var historyTV: UITextView!
    
    }

