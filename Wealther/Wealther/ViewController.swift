//
//  ViewController.swift
//  Wealther
//
//  Created by Naing Lin Aung on 3/6/15.
//  Copyright (c) 2015 Naing Lin Aung. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet weak var wealthertext: UITextField!
    @IBOutlet weak var wealtherLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showError() {
        wealtherLabel.text = "was not able to find wealther for"+wealthertext.text+"Please try again"
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        wealthertext.resignFirstResponder()
        return true
    }

    
    
    @IBAction func forecastWealther(sender: AnyObject) {
        
        var input =  wealthertext.text.stringByReplacingOccurrencesOfString(" ", withString: "-")
        
        var wealther = ""
        
        let url = NSURL(string: "http://www.weather-forecast.com/locations/"+input+"/forecasts/latest")
        
        if url != nil {
            
            println("hi")
            let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
                
                var urlError = false
                
                if error == nil {
                    var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding)
                    
                    var urlContentArray = urlContent!.componentsSeparatedByString("<span class=\"phrase\">")
                    
                    if urlContentArray.count > 0 {
                        
                        var wealtherArray = urlContentArray[1].componentsSeparatedByString("</span>")
                        wealther =  wealtherArray[0] as String
                        wealther = wealther.stringByReplacingOccurrencesOfString("&deg;", withString: "º")
                        
                    } else {
                        urlError = true
                    }
                    
                } else {
                    urlError = true
                }
                
                dispatch_sync(dispatch_get_main_queue()) {
                    
                    if urlError == true {
                        self.showError()
                    } else {
                        self.wealtherLabel.text = wealther
                    }
                }
                
                
            })
            
            task.resume()
            
        } else {
            showError()
        }
        
        
        
        
        
        
    }
    
}

