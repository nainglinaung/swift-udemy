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
        
        newUser.setValue("Christ", forKey: "username")
        newUser.setValue("pass2", forKey: "password")
        
        content.save(nil)
        
        var request = NSFetchRequest(entityName: "Users")
        
        request.returnsObjectsAsFaults = false
        
        request.predicate = NSPredicate(format: "username = %@", "Christ")
        
        
        var results = content.executeFetchRequest(request, error: nil)
        
        
        
        if results?.count > 0 {
            for result:AnyObject in results! {
                if let user = result.valueForKey("username") as? String {
                    
                    if user == "Christ" {
//                        content.deleteObject(result as NSManagedObject)
//                        println("User \(user) has been deleted")
                        result.setValue("Lorem", forKey: "username")
                    }
                    
                    content.save(nil)
                    println(result)
                }
                
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

