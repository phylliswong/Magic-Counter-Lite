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
  
    // Keep track of colors with an enum and and index
    var currentBGColor = 0
    var colorsArray = [Colors.Green, .White, .Blue, .Black, .Red]
  
  
  // MARK: IBOutlets
  
    @IBOutlet weak var lifeCounterLabel: UILabel!
  
  
  // MARK: IBActions
  
    @IBAction func pressedColorsButton() {
      // Get the next color
        nextColor()
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
  
  
  // MARK: View Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Moved initialization to some helper methods
    setupLife()
    setupBackground()
  }
  
  
  // MARK: Setup
  
  func setupLife() {
    self.lifeCounterLabel.text = lifeCounter.description
    self.lifeCounterLabel.textColor = lifeCounterLabelColor
  }
  
  func setupBackground() {
     self.view.backgroundColor = colorsArray[currentBGColor].toUIColor()
  }
  
  func nextColor() {
    // Get the next color on the wheel
    currentBGColor += 1
    currentBGColor = currentBGColor % colorsArray.count
    setupBackground()
  }
  
  func setBackgroundColor(index: Int) {
    
  }
    

  // MARK: Utility
  
    func setLifeCounterLabelColorToRed() -> UIColor {
        let color = UIColor.red
        return color
    }

}

