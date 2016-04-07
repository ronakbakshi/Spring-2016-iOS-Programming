//
//  SettingsViewController.swift
//  Bakshi_The Botanical Assignment
//
//  Created by Bakshi,Ronak on 3/30/16.
//  Copyright © 2016 Bakshi,Ronak. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var colorSC: UISegmentedControl!
    
    @IBOutlet weak var noOfRaindropsTF: UITextField!
    
    @IBOutlet weak var radiusSlider: UISlider!
    
    var index:Int!
    
    var rainVC:RainViewController!
    
    override func viewDidLoad() {
        index=0
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        colorSC.selectedSegmentIndex = index
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Setting the default value of 500 raindrops when invalid data is entered
    @IBAction func doneBTN(sender: AnyObject) {
        index = colorSC.selectedSegmentIndex
        rainVC.dropColor = colorSC.titleForSegmentAtIndex(index)
        print(rainVC.dropColor)
        rainVC.dropRadius = Double(radiusSlider.value)
        print(rainVC.dropRadius)
        var optional:Int?
        let noOfRain = noOfRaindropsTF.text
        optional = Int(noOfRain!)
        if optional != nil
        {
            if optional > 0 {
                rainVC.numberOfRainDrops = Int(noOfRaindropsTF.text!)!
                print(rainVC.numberOfRainDrops)
            }
            else{
                rainVC.numberOfRainDrops = 500
            }
           
        } else {
            
            rainVC.numberOfRainDrops = 500
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
   
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
