//
//  FirstViewController.swift
//  Bakshi_The Botanical Assignment
//
//  Created by Bakshi,Ronak on 3/30/16.
//  Copyright © 2016 Bakshi,Ronak. All rights reserved.
//

import UIKit

class RainViewController: UIViewController {
    

    
    @IBOutlet weak var rainView: RainView!
    var dropColor:String!
    
    var dropRadius:Double!
    var numberOfRainDrops:Int!
    
    
    override func viewDidLoad() {
        
        rainView.rainVC = self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        rainView.setNeedsDisplay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let SVC:SettingsViewController = segue.destinationViewController as? SettingsViewController{
            SVC.rainVC = self
        }
    }

}

