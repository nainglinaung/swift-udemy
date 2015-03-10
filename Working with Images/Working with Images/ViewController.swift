//
//  ViewController.swift
//  Working with Images
//
//  Created by Naing Lin Aung on 3/10/15.
//  Copyright (c) 2015 Naing Lin Aung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    var counter = 1

    @IBOutlet weak var imageView: UIImageView!
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func updateFrame() {
        counter++
        
        if counter == 6 {
            counter = 1
        }
        imageView.image = UIImage(named: "frame\(counter).jpg")
    }
    
    
    override func viewDidLayoutSubviews() {
      imageView.frame = CGRectMake(100, 20, 0, 0)
    }
    
    override func viewDidAppear(animated: Bool) {
        
        UIView.animateWithDuration(1, animations: { () -> Void in
           self.imageView.frame = CGRectMake(100, 20, 50, 100)
        })
    }

}

