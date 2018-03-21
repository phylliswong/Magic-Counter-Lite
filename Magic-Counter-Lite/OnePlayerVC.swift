//
//  ViewController.swift
//  Magic-Counter-Lite
//
//  Created by Phyllis Wong on 2/16/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//

import UIKit

class OnePlayerVC: UIViewController {
    
    var lifeCounter: Int = 20
    var lifeCounterLabelColor = UIColor.white
    var wins: Int = 0
    
  
    // Keep track of colors with an enum and index
    var currentBGColor = 0
    var colorsArray = [Colors.green, .red, .blue, .white, .black, .colorless]
  
  
    // MARK: Outlets
    @IBOutlet weak var lifeCounterLabel: UILabel!
    @IBOutlet weak var winsLabel: UILabel!
    
    
    // MARK: Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        // Start with 20 life and green background
        setupBackground()
        
    }

    
    // Lock the view in Portrait
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        AppDelegate.AppUtility.lockOrientation(.portrait)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        AppDelegate.AppUtility.lockOrientation(.all)
    }
    
    func setupBackground() {
        // Start the background on Green
        self.view.backgroundColor = colorsArray[currentBGColor].toUIColor()
    }
    
    func nextColor() {
        // Get the next color on the wheel
        currentBGColor += 1
        currentBGColor = currentBGColor % colorsArray.count
        setupBackground()
    }
    
  
    // MARK: Actions
    @IBAction func pressedColorsButton() {
        // Cycle through the different background colors
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
    
    
    // Update the label and the life variable for the swipe gestures
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
    
    // Change the life total with swipe gestures
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

    
    // Add 1 to the total life and set the font color
    @IBAction func pressedPlus() {
        self.lifeCounter += 1
        self.lifeCounterLabel.text = lifeCounter.description
        
        if self.lifeCounter > 0 {
            let white = UIColor.white
            self.lifeCounterLabel.textColor = white
        }
        
    }
    
    // Subtract 1 from the total life and set the font color
    @IBAction func pressedMinus() {
        self.lifeCounter -= 1
        self.lifeCounterLabel.text = lifeCounter.description
        
        if self.lifeCounter <= 0 {
            let red = setLifeCounterLabelColorToRed()
            self.lifeCounterLabel.textColor = red
        }
    }
    
    func setLifeCounterLabelColorToRed() -> UIColor {
        let color = UIColor.red
        return color
    }
    
    // Reset the life to 20 and set the font color
    @IBAction func pressedReset() {
        self.lifeCounter = 20
        self.lifeCounterLabel.text = lifeCounter.description
        self.lifeCounterLabel.textColor = UIColor.white
    }
    
    // hide the keyboard when user touches outside the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

