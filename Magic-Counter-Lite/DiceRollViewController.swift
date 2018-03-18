//
//  DiceRollViewController.swift
//  Magic-Counter-Lite
//
//  Created by Phyllis Wong on 3/14/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//

import UIKit
import Foundation

class DiceRollViewController: UIViewController {
    
    // Keep track of colors with an enum and index
    var currentBGColor = 0
    var colorsArray = [Colors.green, .red, .blue, .white, .black, .colorless]
    var numbersArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]

    @IBOutlet weak var diceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        diceLabel.font = diceLabel.font.withSize(50)
        diceLabel.text = "Shake me"
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
    
    // Allows for shake gestures to be recognized
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    // When the motion ends, call the func to update the label
    // Change color of background when the number changes
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            timerCounter = 15
            startTimer()
            
        }
    }
    
    var timerCounter = 15
    var timerTest = Timer()
    
    func startTimer () {
        timerTest =  Timer.scheduledTimer(
            timeInterval: TimeInterval(0.08),
            target      : self,
            selector    : #selector(self.updateDiceLabel),
            userInfo    : nil,
            repeats     : true)
    }

    // Grab random index from the numbers array
    @objc func updateDiceLabel() {
        let randomIndex  = Int(arc4random_uniform(20))
        diceLabel.font = diceLabel.font.withSize(200)
        let randomDiceRoll = numbersArray[randomIndex]
        diceLabel.text = "\(randomDiceRoll)"
        timerCounter -= 1
        
        if timerCounter == 0 {
            nextColor()
            timerTest.invalidate()
        }
    }

    func dismissView() {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func singleUserButton(_ sender: UIBarButtonItem) {
       dismissView()
    }
    
    @IBAction func twoUserButton(_ sender: UIBarButtonItem) {
        dismissView()
    }
    
    
    @IBAction func resetButton(_ sender: UIButton) {
        timerCounter = 15
        startTimer()
    }
    
}
