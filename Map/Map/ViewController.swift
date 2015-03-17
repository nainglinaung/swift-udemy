//
//  ViewController.swift
//  Map
//
//  Created by Naing Lin Aung on 3/17/15.
//  Copyright (c) 2015 Naing Lin Aung. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

   // 40.748570, -73.985696
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var longtitude:CLLocationDegrees = -73.985696
        var latitude:CLLocationDegrees = 40.748570
        var latDelta:CLLocationDegrees = 0.01
        var longDelta:CLLocationDegrees = 0.01
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longtitude)
        
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        mapView.setRegion(region, animated: true)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

 