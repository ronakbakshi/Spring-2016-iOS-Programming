//
//  SecondViewController.swift
//  Bakshi_The Botanical Assignment
//
//  Created by Bakshi,Ronak on 3/30/16.
//  Copyright © 2016 Bakshi,Ronak. All rights reserved.
//

import UIKit

class FernViewController: UIViewController {

    var fernMaker:FernMaker!
    
    @IBOutlet weak var fernView: FernView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        fernMaker = FernMaker()
        fernView.fernMaker = fernMaker
        fernMaker.generateFern(1000)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

