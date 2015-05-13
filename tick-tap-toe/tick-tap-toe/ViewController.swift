//
//  ViewController.swift
//  tick-tap-toe
//
//  Created by Naing Lin Aung on 3/12/15.
//  Copyright (c) 2015 Naing Lin Aung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var button: UIButton!
    
    
    // 0 empty 1 nought 2 cross
    var goNumber = 1
    var gameState = [0,0,0, 0,0,0, 0,0,0]
    var winningCombination = [[0,1,2],[3,4,5],[6,7,8],
    [0,3,6], [1,4,7], [2,5,8],[0,4,8],[2,4,6]]
    var winner = 0

    @IBOutlet var label: UILabel!
    @IBOutlet weak var tryAgain: UIButton!
    
    
    @IBAction func click(sender: AnyObject) {
        var image:UIImage?
        label.center = CGPointMake(label.center.x + 400, label.center.y)
        var send = sender.tag - 1
        
        if winner == 0 {
            if gameState[send] == 0 {
                goNumber++
                if (goNumber % 2 == 0 ) {
                    gameState[send] = 2
                   image = UIImage(named: "cross.png")
                } else {
                    image = UIImage(named: "nought.png")
                    gameState[send] = 1
                }
                
                for combination in winningCombination {
                    if gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] && gameState[combination[0]] != 0 {
                        winner = gameState[combination[0]]
                    }
                }
                if winner != 0 {
                    
                    label.text = ( winner == 2 ? "Cross" : "Nought") + " is the winner"
                
                    UIView.animateWithDuration(0.4, animations: { () -> Void in
                        self.label.alpha = 1
                        self.tryAgain.alpha = 1
                    })
                }
                
                sender.setImage(image, forState: .Normal)
                
            }
        }
    }
    

    @IBAction func Again() {
        label.alpha = 0
        tryAgain.alpha = 0
        winner = 0
        gameState = [0,0,0, 0,0,0, 0,0,0]
        var ButtonLoop:UIButton
        
        for var i = 1; i <= 9; i++ {
            ButtonLoop = view.viewWithTag(i) as! UIButton
            ButtonLoop.setImage(nil, forState: .Normal)
        }
    }
  
    override func viewDidAppear(animated: Bool) {
        label.alpha = 0
        tryAgain.alpha = 0
    }
}

