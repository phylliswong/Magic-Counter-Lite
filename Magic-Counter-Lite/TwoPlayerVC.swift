//
//  TwoPlayerVC.swift
//  Magic-Counter-Lite
//
//  Created by Phyllis Wong on 3/17/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//

import UIKit

class TwoPlayerVC: UIViewController {
    
    @IBOutlet weak var topStack: UIStackView!
    @IBOutlet weak var bottomStack: UIStackView!
    
    @IBOutlet weak var playerOneLife: UILabel!
    @IBOutlet weak var playerTwoLife: UILabel!
    
    // Keep track of colors with an enum and index
    var currentBGColorPlayer1 = 0
    var currentBGColorPlayer2 = 0
    var colorsArray = [Colors.green, .red, .blue, .white, .black, .colorless]
    
    
    @IBAction func pressedPlayerOneMinus(_ sender: Any) {
        print("subtract one from player 1")
    }
    @IBAction func pressedPlayerOnePlus(_ sender: Any) {
        print("add one to player 1")
    }
    @IBAction func pressedPlayerTwoMinus(_ sender: Any) {
        print("subtract one from player 2")
    }
    @IBAction func pressedPlayerTwoPlus(_ sender: Any) {
        print("add one to player 2")
    }
    
    
    
    func setupBackgroundPlayerOne() {
        // Start the background on Green
        let backgroundColor = colorsArray[currentBGColorPlayer1].toUIColor()
        self.topStack.addBackground(color: backgroundColor)
    }
    
    func setupBackgroundPlayerTwo() {
        // Start the background on Green
        let backgroundColor = colorsArray[currentBGColorPlayer2].toUIColor()
        self.bottomStack.addBackground(color: backgroundColor)
    }
    
    func nextColorPlayerOne() {
        // Get the next color on the wheel
        currentBGColorPlayer1 += 1
        currentBGColorPlayer1 = currentBGColorPlayer1 % colorsArray.count
        setupBackgroundPlayerOne()
    }
    
    func nextColorPlayerTwo() {
        // Get the next color on the wheel
        currentBGColorPlayer2 += 1
        currentBGColorPlayer2 = currentBGColorPlayer1 % colorsArray.count
        setupBackgroundPlayerTwo()
    }
    
    @IBAction func pressedColorsPlayer1(_ sender: UIButton) {
        nextColorPlayerOne()
        print("pressed colors player One\n")
    }
    

    @IBAction func pressedColorsPlayer2(_ sender: UIButton) {
        print("pressed colors player Two\n")
        nextColorPlayerTwo()
    }
    
    // Swipe gestures for Player One StackView
    @IBAction func swipedRightP1(_ sender: UISwipeGestureRecognizer) {
        print("right")
    }
    @IBAction func swipedLeftP1(_ sender: UISwipeGestureRecognizer) {
        print("left")
    }
    @IBAction func swipedUpP1(_ sender: UISwipeGestureRecognizer) {
        print("up")
    }
    @IBAction func swipedDownP1(_ sender: UISwipeGestureRecognizer) {
        print("down")
    }
    
    // Swipe gestures for Player Two StackView
    @IBAction func swipedRightP2(_ sender: UISwipeGestureRecognizer) {
        print("right")
    }
    @IBAction func swipedLeftP2(_ sender: UISwipeGestureRecognizer) {
        print("left")
    }
    @IBAction func swipedUpP2(_ sender: UISwipeGestureRecognizer) {
        print("up")
    }
    @IBAction func swipedDownP2(_ sender: UISwipeGestureRecognizer) {
        print("down")
    }
    
    
    @IBAction func onePlayerButton(_ sender: UIBarButtonItem) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}




extension UIStackView {
    
    func addBackground(color: UIColor) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
}


