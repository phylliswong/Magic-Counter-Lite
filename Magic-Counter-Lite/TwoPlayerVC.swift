//
//  TwoPlayerVC.swift
//  Magic-Counter-Lite
//
//  Created by Phyllis Wong on 3/17/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//

import UIKit

class TwoPlayerVC: UIViewController {
    
    
    @IBAction func onePlayerButton(_ sender: UIBarButtonItem) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var playerOneStackView: UIStackView!
    
    func animateViews() {
        playerOneStackView.axis = .vertical
        
        let animations = {
            self.playerOneStackView.axis = .horizontal
            self.playerOneStackView.transform = CGAffineTransform.identity
            self.playerOneStackView.alpha = 1
            
            self.view.layoutIfNeeded()
        }
        
        // Original state
        playerOneStackView.transform = CGAffineTransform(scaleX: 0, y: 0)
        playerOneStackView.alpha = 0
        
        // Animate all the things
        UIView.animate(withDuration: 1.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.7, options: .curveEaseInOut, animations: animations, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateViews()
    }

}
