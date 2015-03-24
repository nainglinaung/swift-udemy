//
//  ViewController.swift
//  working with webview
//
//  Created by Naing Lin Aung on 3/24/15.
//  Copyright (c) 2015 Naing Lin Aung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var url = NSURL(string: "http://www.google.com")
//        
//        var request = NSURLRequest(URL: url!)
//        
//        webView.loadRequest(request)
//        
        
        var html = "<html><head><title>hi</title></head><body>lorem ipsum</body></html>"
        
        webView.loadHTMLString(html, baseURL: nil)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

