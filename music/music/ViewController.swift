//
//  ViewController.swift
//  music
//
//  Created by Naing Lin Aung on 3/21/15.
//  Copyright (c) 2015 Naing Lin Aung. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player:AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional etup after loading the view, typically from a nib.
        let fileLocation = NSString(string: NSBundle.mainBundle().pathForResource("green", ofType: "mp3")!)
        
        var error:NSError? = nil
        
        player = AVAudioPlayer(contentsOfURL: NSURL(string:fileLocation), error: &error)
        
        player.play()
        
        
    }

  
    var flag = true
    
    @IBAction func change(sender: UISlider) {
     //   println(sender.value)
        player.volume = sender.value
    }
    
    
    @IBOutlet weak var pauseOrResume: UIButton!
    
    @IBAction func pauseAndResume(sender: AnyObject) {
        
        var tile:String? = "lorem"
        
        if flag {
            player.pause()
            
        } else {
            player.play()
        }
        
        flag = !flag
        
    }
    
    
    @IBAction func stop(sender: UIButton) {
        player.stop()
    }
    
 
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

