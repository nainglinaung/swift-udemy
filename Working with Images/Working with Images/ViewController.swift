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
        imageView.center = CGPointMake(imageView.center.x - 400, imageView.center.y + 200)
    }
    
    override func viewDidAppear(animated: Bool) {
        
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.imageView.center = CGPointMake(self.imageView.center.x + 400, self.imageView.center.y - 200)
        })
    }

}

