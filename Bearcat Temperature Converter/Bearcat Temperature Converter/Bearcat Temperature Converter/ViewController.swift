//
//  ViewController.swift
//  Bearcat Temperature Converter
//
//  Created by Bakshi,Ronak on 1/28/16.
//  Copyright © 2016 Bakshi,Ronak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func colorForTempearture(tempCelsius : Double){
        
    }
    
    func celsiusToFahrenheit(tempCelsius:Double) -> Double{
        return (9/5 * tempCelsius) + 32
    }
    
    func fahrenheitToCelsius(tempFahrenheit:Double) -> Double{
        return (5/9 * (tempFahrenheit - 32 ))
    }
    
    @IBOutlet weak var celsiusTF: UITextField!
    
    @IBOutlet weak var fahrenheitTF: UITextField!
    
    @IBAction func fahrenheitToCelsiusBTN(sender: AnyObject) {
        let fahrenheitInDouble = Double(fahrenheitTF.text!)
        celsiusTF.text = fahrenheitToCelsius(fahrenheitInDouble!).description
    }
    
    @IBAction func CelsiusToFahrenheit(sender: AnyObject) {
        let celsiusInDouble = Double(celsiusTF.text!)
        fahrenheitTF.text = celsiusToFahrenheit(celsiusInDouble!).description
    }

    
}

