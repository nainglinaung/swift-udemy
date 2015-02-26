//
//  ViewController.swift
//  IsPrime
//
//  Created by Naing Lin Aung on 2/20/15.
//  Copyright (c) 2015 Naing Lin Aung. All rights reserved.
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
    @IBOutlet var answerbox: UILabel!

    @IBOutlet var num: UITextField!

    @IBAction func check(sender: UIButton) {
        
        if var number  = num.text.toInt()? {
            
            var isPrime = (number == 1) ? false : true;
        
            for (var i = 2; i < number; i++) {
                if  number % i == 0 {
                    isPrime = false
                }
            }
            
            answerbox.text = (isPrime == true) ? "number is prime" : "number is not a prime";
            
        }
        
    }
}

