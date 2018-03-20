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
    
    // Keep track of colors with an enum and index
    var currentBGColor = 0
    var colorsArray = [Colors.green, .red, .blue, .white, .black, .colorless]
    
    func setupBackground() {
        // Start the background on Green
        let backgroundColor = colorsArray[currentBGColor].toUIColor()
        self.topStack.addBackground(color: backgroundColor)
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
        UIView.animate(withDuration: 1.4, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: animations, completion: { _ in
        })
    }
    
    // Use instead of viewDidLoad for the animation
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupBackground()
        animateViews()
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


