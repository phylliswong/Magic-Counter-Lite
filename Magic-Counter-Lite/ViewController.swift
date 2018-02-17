//
//  ViewController.swift
//  Magic-Counter-Lite
//
//  Created by Phyllis Wong on 2/16/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var lifeCounter: Int = 20
    var lifeCounterLabelColor = UIColor.white
    
    @IBOutlet weak var lifeCounterLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.lifeCounterLabel.text = lifeCounter.description
        self.lifeCounterLabel.textColor = lifeCounterLabelColor
    }

    
    @IBAction func pressedColorsButton() {
        self.view.backgroundColor = UIColor.blue
    }
    
    @IBAction func pressedPlus() {
        self.lifeCounter += 1
        self.lifeCounterLabel.text = lifeCounter.description
        
        if self.lifeCounter > 0 {
            let white = UIColor.white
            self.lifeCounterLabel.textColor = white
        }
        
    }
    
    @IBAction func pressedMinus() {
        self.lifeCounter -= 1
        self.lifeCounterLabel.text = lifeCounter.description
        
        if self.lifeCounter <= 0 {
            let red = setLifeCounterLabelColorToRed()
            self.lifeCounterLabel.textColor = red
        }
    }
    
    
    @IBAction func pressedReset() {
        self.lifeCounter = 20
        self.lifeCounterLabel.text = lifeCounter.description
        self.lifeCounterLabel.textColor = UIColor.white
    }
    

    func setLifeCounterLabelColorToRed() -> UIColor {
        let color = UIColor.red
        return color
    }

}

