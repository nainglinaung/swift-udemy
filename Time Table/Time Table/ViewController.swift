//
//  ViewController.swift
//  Time Table
//
//  Created by Naing Lin Aung on 2/26/15.
//  Copyright (c) 2015 Naing Lin Aung. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate {

    @IBOutlet var sliderValue: UISlider!
    
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        let timeTable = Int(sliderValue.value * 20) 
        println(timeTable)
        cell.textLabel?.text = String(timeTable * indexPath.row)
        return cell
    }
    

    @IBAction func sliderMoved(sender: AnyObject) {
        println(sliderValue)
        table.reloadData()
    }
}

