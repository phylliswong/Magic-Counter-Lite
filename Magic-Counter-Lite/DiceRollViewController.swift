//
//  DiceRollViewController.swift
//  Magic-Counter-Lite
//
//  Created by Phyllis Wong on 3/14/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//

import UIKit

class DiceRollViewController: UIViewController {
    
    // Keep track of colors with an enum and index
    var currentBGColor = 0
    var colorsArray = [Colors.green, .red, .blue, .white, .black, .colorless]

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
    
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            self.updateDiceLabel()
            nextColor()
        }
    }

    
    func updateDiceLabel() {
        var randomNum = 0
        while randomNum < 1 { randomNum = Int(arc4random_uniform(21)) }
        diceLabel.font = diceLabel.font.withSize(200)
        diceLabel.text = "\(randomNum)"
    }

//    @IBAction func backButton(_ sender: UIButton) {
//        self.presentingViewController?.dismiss(animated: true, completion: nil)
//    }
    
    @IBAction func singleUserButton(_ sender: UIBarButtonItem) {
       self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
  
    
    @IBAction func resetButton(_ sender: UIButton) {
        diceLabel.font = diceLabel.font.withSize(50)
        diceLabel.text = "Shake me"
    }
    
}
