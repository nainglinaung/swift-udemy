//
//  ViewController.swift
//  Core Data
//
//  Created by Naing Lin Aung on 3/23/15.
//  Copyright (c) 2015 Naing Lin Aung. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var appDel:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        var content:NSManagedObjectContext = appDel.managedObjectContext!
        
        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: content) as NSManagedObject
        
        newUser.setValue("Rob", forKey: "username")
        newUser.setValue("pass", forKey: "password")
        
        content.save(nil)
        
        var request = NSFetchRequest(entityName: "Users")
        
        request.returnsObjectsAsFaults = false
        
        
        var results = content.executeFetchRequest(request, error: nil)
        
        if results?.count > 0 {
        
            for result:AnyObject in results! {
                  println(result.password)
            }
        
        } else {
            println("no result")
        }
        
      
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

