//
//  ViewController.swift
//  Map
//
//  Created by Naing Lin Aung on 3/17/15.
//  Copyright (c) 2015 Naing Lin Aung. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {

   // 40.748570, -73.985696
    @IBOutlet weak var mapView: MKMapView!
    var manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        
        
        var longtitude:CLLocationDegrees = -73.985696
        var latitude:CLLocationDegrees = 40.748570
        var latDelta:CLLocationDegrees = 0.01
        var longDelta:CLLocationDegrees = 0.01
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longtitude)
        
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        var annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "I want to go there"
        annotation.subtitle = "jk only if that is akihabara"
        
        mapView.addAnnotation(annotation)
        
        var longpress = UILongPressGestureRecognizer(target: self, action: "action:")
        longpress.minimumPressDuration = 2.0
        
        mapView.setRegion(region, animated: true)
        
        mapView.addGestureRecognizer(longpress)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func action(gestureRegonizer:UIGestureRecognizer) {
        println("Hi mom");
        var touchpoint = gestureRegonizer.locationInView(self.mapView)
        var newCoodinate:CLLocationCoordinate2D = mapView.convertPoint(touchpoint, toCoordinateFromView: self.mapView)
        
        var newAnnotation = MKPointAnnotation()
        
        newAnnotation.coordinate = newCoodinate
        newAnnotation.title = "I want to go there"
        newAnnotation.subtitle = "jk only if that is akihabara"
        
        mapView.addAnnotation(newAnnotation)
        
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        var userLocation:CLLocation = locations[0] as! CLLocation
      
        
        var longtitude:CLLocationDegrees =  userLocation.coordinate.longitude
        var latitude:CLLocationDegrees = userLocation.coordinate.latitude
        var latDelta:CLLocationDegrees = 0.01
        var longDelta:CLLocationDegrees = 0.01
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longtitude)
        
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        mapView.setRegion(region, animated: true)
        
        
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("error is \(error)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

 