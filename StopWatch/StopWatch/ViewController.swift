//
//  ViewController.swift
//  StopWatch
//
//  Created by Naing Lin Aung on 2/24/15.
//  Copyright (c) 2015 Naing Lin Aung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer()
    @IBOutlet var time: UILabel!
    var count = 0
    var sec = 0
    var min = 0
    var hour = 0
    
    func updateTime() {
        count++
        var seconds:String, minutes:String, hours:String
        var milisec = 0
        
        if count > 99 {
            sec++
            count -= 100
        }
        
        
        if sec > 59 {
            min++
            sec -= 60
        }
        
        
        if min > 59 {
            hour++
            min -= 60
        }
    
        
        if min < 10 {
            minutes = "0\(min)"
        } else {
            minutes = "\(min)"
        }
        
        if sec < 10 {
            seconds =  "0\(sec)"
        } else {
            seconds = "\(sec)"
        }
        
        if hour < 10 {
            hours = "0\(hour)"
        } else {
            hours = "\(hour)"
        }
        
        
    
        time.text = "\(hours):\(minutes):\(seconds):\(count)"
        //println("\(count)")
    }
    
    
    @IBAction func play(sender: AnyObject) {
    
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("updateTime"), userInfo: nil, repeats: true)
    
    }
    @IBAction func stop(sender: AnyObject) {
        timer.invalidate()
        count = 0
        time.text = "00:00:00:00"
    }
    @IBAction func pause(sender: AnyObject) {
        timer.invalidate()
    
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

