//
//  ViewController.swift
//  sound shaker
//
//  Created by Naing Lin Aung on 3/23/15.
//  Copyright (c) 2015 Naing Lin Aung. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    var player:AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        if event.subtype == UIEventSubtype.MotionShake {
            // Do any additional etup after loading the view, typically from a nib.
            
            var location = ["disco","french","friend","sunshine","green"]
            
            var ranDom = Int(arc4random_uniform(UInt32(location.count)))
            
            let fileLocation = NSString(string: NSBundle.mainBundle().pathForResource(location[ranDom], ofType: "mp3")!)
            
            var error:NSError? = nil
            
            player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: fileLocation), error: &error)
            
            player.play()
       
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

