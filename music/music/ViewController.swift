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
    var flag = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional etup after loading the view, typically from a nib.
        let fileLocation = NSString(string: NSBundle.mainBundle().pathForResource("green", ofType: "mp3")!)
        
        var error:NSError? = nil
        
        player = AVAudioPlayer(contentsOfURL: NSURL(string:fileLocation as String), error: &error)
        player.play()
        
    }
    

    @IBAction func change(sender: UISlider) {
        player.volume = sender.value
    }
    
    @IBAction func stop(sender: UIBarButtonItem) {
        player.stop()
    }
    
    @IBAction func play(sender: UIBarButtonItem) {
        player.play()
    }
    
    @IBAction func pause(sender: UIBarButtonItem) {
        player.pause()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

