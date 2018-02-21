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
    var wins: Int = 0
    
  
    // Keep track of colors with an enum and index
    var currentBGColor = 0
    var colorsArray = [Colors.green, .red, .blue, .white, .black, .colorless]
  
  
    // MARK: Outlets
    @IBOutlet weak var lifeCounterLabel: UILabel!
    @IBOutlet weak var winsLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Start with 20 life and green background
        setupLife()
        setupBackground()
    }
    
  
    // MARK: Actions
    @IBAction func pressedColorsButton() {
        // Get the next color
        nextColor()
    }
    
    @IBAction func pressedWin() {
        self.wins += 1
        self.winsLabel.text = wins.description
    }
    
    @IBAction func pressedLose() {
        self.wins -= 1
        self.winsLabel.text = wins.description
    }
    
    @IBAction func pressedResetWins() {
        self.wins = 0
        self.winsLabel.text = wins.description
    }
    
    

    // Update the label and the life variable for the swipe gesture
    private func updateLifeCounter(_ num: Int) {
        lifeCounter += num
        lifeCounterLabel.text = lifeCounter.description
        
        if self.lifeCounter > 0 {
            let white = UIColor.white
            self.lifeCounterLabel.textColor = white
        } else {
            let red = setLifeCounterLabelColorToRed()
            self.lifeCounterLabel.textColor = red
        }
    }
    
    @IBAction func didSwipeLeft(_ sender: UISwipeGestureRecognizer) {
        let life = -10
        updateLifeCounter(life)
    }
    @IBAction func didSwipeRight(_ sender: UISwipeGestureRecognizer) {
        let life = 10
        updateLifeCounter(life)
    }
    
    @IBAction func swipedUp(_ sender: UISwipeGestureRecognizer) {
        let life = 5
        updateLifeCounter(life)
    }
    
    @IBAction func swipedDown(_ sender: UISwipeGestureRecognizer) {
        let life = -5
        updateLifeCounter(life)
    }
    
    
    func updateWins() {
        self.wins += 1
        winsLabel.text = wins.description
    }
    
    func updateLoses() {
        //self.loses += 1
//        losesLabel.text = loses.description
    }
    
    @IBAction func resetWins() {
        self.wins = 0
       // self.loses = 0
        self.winsLabel.text = wins.description
//        self.losesLabel.text = loses.description
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

  // MARK: Utility
  
    func setLifeCounterLabelColorToRed() -> UIColor {
        let color = UIColor.red
        return color
    }

}

