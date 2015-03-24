//
//  ViewController.swift
//  Storing images
//
//  Created by Naing Lin Aung on 3/24/15.
//  Copyright (c) 2015 Naing Lin Aung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "http://mmotaku.net/wp-content/uploads/2014/09/Bakuman-01.jpg")
        
        let urlRequest = NSURLRequest(URL: url!)
        
        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue.mainQueue()) { (Response, data, error) -> Void in
            if error != nil {
                println(error)
            } else {
                let img = UIImage(data: data)
                var directory:String?
                var path:[AnyObject] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
                
                if path.count > 0 {
                    directory = path[0] as? String
                    var savePath = directory! + "Bakuman.jpg"
                    NSFileManager.defaultManager().createFileAtPath(savePath, contents: data, attributes: nil)
                    self.image.image = UIImage(named: savePath)
                    
                }
                
            }
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

