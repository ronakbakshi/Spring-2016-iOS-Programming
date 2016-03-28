//
//  ViewController.swift
//  Bakshi_The Multilingual App
//  @Author: Ronak Bakshi-S524975
//  Created by Bakshi,Ronak on 3/27/16.
//  Copyright © 2016 Bakshi,Ronak. All rights reserved.
//  This application best works for iPhone6s Plus

import UIKit

class TranslateViewController: UIViewController {
    
    var selectedLanguage:String!
    var translatedText:String!
    
    @IBOutlet weak var languagesSC: UISegmentedControl!
    
    @IBOutlet weak var textToTranslateTV: UITextView!
    
    @IBOutlet weak var translatedTextTV: UITextView!
    let languageCode =
    ["Japanese":"ja", "French":"fr", "Hindi":"hi"]
    
    let key:String = "trnsl.1.1.20160307T213950Z.3c5c87c3e34aaaae.bfe9021dfa7e4b7e1ef4826c52e2e8781c8a1813"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let selectedLanguageIndex:Int = languagesSC.selectedSegmentIndex
        selectedLanguage = languagesSC.titleForSegmentAtIndex(selectedLanguageIndex)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "displayResults:", name: "Data Delivered", object: nil)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayResults(notification:NSNotification){
        translatedTextTV.text = translatedText
    }
    
    
    
    
    @IBAction func languageSC(sender: AnyObject) {
        let selectedLanguageIndex:Int = sender.selectedSegmentIndex
        selectedLanguage = sender.titleForSegmentAtIndex(selectedLanguageIndex)
    }
    
    
    @IBAction func translateBTNTouchUpInside(sender: AnyObject) {
        var textToTranslate:String! = textToTranslateTV.text
        textToTranslate = textToTranslate.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
        
        let myURL:String = "https://translate.yandex.net/api/v1.5/tr.json/translate?key="+key+"&text="+textToTranslate+"&lang=en-"+languageCode[selectedLanguage]!
        
        let url = NSURL(string: myURL)
        let session = NSURLSession.sharedSession() // lies in between
        session.dataTaskWithURL(url!, completionHandler: translateData).resume()
        
        
    }
    
    //Implemented the completion handler to parse the result from Yandex
    func translateData(data:NSData?,response:NSURLResponse?,error:NSError?)->Void {
        
        var tranlatedData:[String:AnyObject]!
        do {
            try tranlatedData = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! [String:AnyObject]
            var text:[String] = tranlatedData["text"] as! [String]
            
            translatedText = text[0]
            
            dispatch_async(dispatch_get_main_queue()){
                NSNotificationCenter.defaultCenter().postNotificationName("Data Delivered", object: nil)
            }
            
        }
        catch{
            print("Something has gone wrong")
        }
    }
    
    
}

