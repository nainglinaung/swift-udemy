//
//  ViewController.swift
//  Persistent Storage
//
//  Created by Naing Lin Aung on 2/27/15.
//  Copyright (c) 2015 Naing Lin Aung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var arr = ["lorem","ipsum","dollar"]
        
        NSUserDefaults.standardUserDefaults().setObject(arr, forKey: "get")
        if let get = NSUserDefaults.standardUserDefaults().objectForKey("get") as? NSArray {
            println(get)
        }
        
 
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

