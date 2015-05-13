//
//  ViewController.swift
//  Web Content
//
//  Created by Naing Lin Aung on 3/5/15.
//  Copyright (c) 2015 Naing Lin Aung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string: "http://www.stackoverflow.com")
        println("Hi")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {
            (data,response,error) in
            
             var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding)
            
             println(urlContent)
            
            
//             dispatch_async(dispatch_get_main_queue()) {
//                self.webview.loadHTMLString(urlContent, baseURL: url)
//                
//             }
            
        }
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var webview: UIWebView!

}

