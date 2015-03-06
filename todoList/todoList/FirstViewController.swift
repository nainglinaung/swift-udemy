//
//  FirstViewController.swift
//  todoList
//
//  Created by Naing Lin Aung on 3/5/15.
//  Copyright (c) 2015 Naing Lin Aung. All rights reserved.
//

import UIKit

var itemArray = [String]()


class FirstViewController: UIViewController,UITableViewDelegate {

    @IBOutlet weak var toDolistTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if NSUserDefaults.standardUserDefaults().objectForKey("itemArray") != nil {
            itemArray = NSUserDefaults.standardUserDefaults().objectForKey("itemArray") as [String]
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            itemArray.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(itemArray, forKey: "itemArray")
            toDolistTable.reloadData()
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        toDolistTable.reloadData()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        
         cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }


}

