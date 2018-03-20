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
    var currentBGColor = 0
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
    
    
    
    func setupBackground() {
        // Start the background on Green
        let backgroundColor = colorsArray[currentBGColor].toUIColor()
        self.topStack.addBackground(color: backgroundColor)
        self.bottomStack.addBackground(color: backgroundColor)
    }
    
    func animateViews() {
        let animations = {
            self.topStack.transform = CGAffineTransform(rotationAngle: .pi)
            self.topStack.alpha = 1
        }

        // Original state
        topStack.transform = CGAffineTransform.identity
        topStack.alpha = 1

        // Animate all the things
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.6, options: .curveLinear, animations: animations, completion: { _ in
        })
    }

    // Use instead of viewDidLoad for the animation
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupBackground()
        animateViews()
    }
    
    // Lock the screen in portrait view
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        AppDelegate.AppUtility.lockOrientation(.portrait)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        AppDelegate.AppUtility.lockOrientation(.all)
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


