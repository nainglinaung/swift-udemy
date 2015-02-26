//
//  ViewController.swift
//  Time Table
//
//  Created by Naing Lin Aung on 2/26/15.
//  Copyright (c) 2015 Naing Lin Aung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var sliderValue: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func sliderMoved(sender: AnyObject) {
        
        println(sliderValue)
    }
}

