//
//  ViewController.swift
//  whereAmI
//
//  Created by Naing Lin Aung on 3/19/15.
//  Copyright (c) 2015 Naing Lin Aung. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var longtitude: UILabel!
    @IBOutlet weak var course: UILabel!
    @IBOutlet weak var speed: UILabel!
    @IBOutlet weak var attitude: UILabel!
    
    
    var manager:CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        manager = CLLocationManager()
        manager?.delegate = self
        manager?.desiredAccuracy = kCLLocationAccuracyBest
        manager?.requestWhenInUseAuthorization()
        manager?.startUpdatingLocation()
        
    }
    
    
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println(error)
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        var userlocation = locations[0] as CLLocation
        latitude.text    = "\(userlocation.coordinate.latitude)"
        longtitude.text  = "\(userlocation.coordinate.longitude)"
        attitude.text    = "\(userlocation.altitude)"
        course.text      = "\(userlocation.course)"
        speed.text       = "\(userlocation.speed)"
        location.text    = ""
       
        CLGeocoder().reverseGeocodeLocation(userlocation, completionHandler: { (placeMarks, error) -> Void in
            if error != nil {
                println(error)
                println("hi")
            } else {
                println(placeMarks)
            }
            
            
        })
        
        println(userlocation)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

