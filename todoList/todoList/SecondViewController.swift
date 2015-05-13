//
//  SecondViewController.swift
//  todoList
//
//  Created by Naing Lin Aung on 3/5/15.
//  Copyright (c) 2015 Naing Lin Aung. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var item: UITextField!
    
    @IBAction func addItem(sender: UIButton) {
        itemArray.append(item.text)
        NSUserDefaults.standardUserDefaults().setObject(itemArray, forKey: "itemArray")
        item.text = ""
    }
    
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        item.resignFirstResponder()
        return true
    }


}

