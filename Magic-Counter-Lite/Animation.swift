//
//  Animation.swift
//  Magic-Counter-Lite
//
//  Created by Phyllis Wong on 3/19/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//

import UIKit

extension TwoPlayerVC {
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
        setupBackgroundPlayerOne()
        setupBackgroundPlayerTwo()
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
}
