//
//  FirstViewController.swift
//  The Math Teacher: A Tabberific Assignment!
//  @Author: S524975
//  Created by Bakshi,Ronak on 2/9/16.
//  Copyright © 2016 Bakshi,Ronak. All rights reserved.
//
//  This application is suitable to work for iPhone 6s Plus
import UIKit

class ProblemsViewController: UIViewController {
    var mathTeacher:MathTeacher!
    
    @IBOutlet weak var checkAnsButton: UIButton!
    
    override func viewDidLoad() {
        mathTeacher = (UIApplication.sharedApplication().delegate as! AppDelegate).mathTeacher
       
        
    
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        makeNewProblem()
    }
    @IBOutlet weak var operand1LBL: UILabel!
    
    @IBOutlet weak var operatorLBL: UILabel!
    
    @IBOutlet weak var operand2LBL: UILabel!
    
    @IBOutlet weak var answerTF: UITextField!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayAlertControllerWithTitle(title:String, message:String) {
        let uiAlertController:UIAlertController = UIAlertController(title: title,
            message: message, preferredStyle: UIAlertControllerStyle.Alert)
        uiAlertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel,
            handler:{(action:UIAlertAction)->Void in }))
        self.presentViewController(uiAlertController, animated: true, completion: nil)
        
    }
    
    func makeNewProblem(){
        let settingsVC = (self.tabBarController?.viewControllers![2] as! SettingsViewController)
        
        if settingsVC.maximumProblemSizeTF != nil{
            if let max = Int(settingsVC.maximumProblemSizeTF.text!){
                mathTeacher.maximumProblemSize = max
            }
            else{
                displayAlertControllerWithTitle("Empty or Improper Maximum Problem Size", message: "Setting the maximum problem size to 9")
                mathTeacher.maximumProblemSize = 9
            }
        }
        else{
            mathTeacher.maximumProblemSize = 9
        }
        operand1LBL.text = String(mathTeacher.makeNewProblem()!)
        operand1LBL.text = String(mathTeacher.makeNewProblem()!)
        mathTeacher.operand1 = Int(operand1LBL.text!)!
        operand2LBL.text = String(mathTeacher.makeNewProblem()!)
        mathTeacher.operand2 = Int(operand2LBL.text!)!
        

    }
    
    //Contains the functionality for Check Answer button
    @IBAction func checkAnswerBTN(sender: AnyObject){
        //checkAnswer()
        var checkVal:Bool = false
        let answerEntered:Int! = Int(answerTF.text!)
        if answerEntered == nil{
            displayAlertControllerWithTitle("Error!", message: "Please enter an appropriate value")
        }else{
            if operatorLBL.text == "+" {
                checkVal = mathTeacher.answerIsCorrect(answerEntered, operation: OperationType.Plus)
                if checkVal {
                    
                    displayAlertControllerWithTitle("Good job!", message: "Correct")
                }
                else{
                    displayAlertControllerWithTitle("Oops", message: "Better luck next time!")
                }
            }
            else{
                checkVal = mathTeacher.answerIsCorrect(answerEntered, operation: OperationType.Minus)
                if checkVal {
                    displayAlertControllerWithTitle("Good job!", message: "Correct")
                }
                else{
                    displayAlertControllerWithTitle("Oops", message: "Better luck next time!")
                }
            }
            mathTeacher.history.appendContentsOf("\(mathTeacher.operand1)\(operatorLBL.text!) \(mathTeacher.operand2)=\(answerTF.text!);\(checkVal)\n")
            
        }
    }
    //Contains the functionality for Make New Problem button
    @IBAction func makeNewProblemBTN(sender: AnyObject) {
        makeNewProblem()
       
    }
}

