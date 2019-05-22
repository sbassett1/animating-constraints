//
//  ViewController.swift
//  ConstraintPractice
//
//  Created by Stephen Bassett on 5/21/19.
//  Copyright © 2019 Stephen Bassett. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var redButton: UIButton!
    @IBOutlet var blueButton: UIButton!
    @IBOutlet var yellowButton: UIButton!
    @IBOutlet var toggleButton: UIButton!
    @IBOutlet var menuView: UIView!
    @IBOutlet var topMenuConstraint: NSLayoutConstraint!
    @IBOutlet var bottomToggleConstraint: NSLayoutConstraint!
    
    var isMenuOpen = false
    var originalConstraint: CGFloat = 0.0
    
    var statusBarHeight: CGFloat {
        let height = UIApplication.shared.statusBarFrame.height
        return height > 24 ? 24 : height
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topMenuConstraint.constant = -menuView.frame.size.height + CGFloat(20) + statusBarHeight
        originalConstraint = bottomToggleConstraint.constant
        menuView.layer.shadowOpacity = 0.4
        menuView.layer.shadowColor = UIColor.black.cgColor
        menuView.layer.shadowOffset = CGSize.zero
        menuView.layer.shadowRadius = CGFloat(15.0)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        redButton.layer.cornerRadius = redButton.frame.width / 2
        blueButton.layer.cornerRadius = blueButton.frame.width / 2
        yellowButton.layer.cornerRadius = yellowButton.frame.width / 2
    }

    @IBAction func redButtonTapped(_ sender: Any) {
        view.backgroundColor = UIColor.red
    }
    
    @IBAction func blueButtonTapped(_ sender: Any) {
        view.backgroundColor = UIColor.blue
    }
    
    @IBAction func yellowButtonTapped(_ sender: Any) {
        view.backgroundColor = UIColor.yellow
    }
    
    @IBAction func toggleButtonTapped(_ sender: UIButton) {
        if isMenuOpen {
            sender.setTitle("Open", for: .normal)
            isMenuOpen = false
            closeMenu()
        }
        else {
            sender.setTitle("Close", for: .normal)
            isMenuOpen = true
            openMenu()
        }
    }
    
    func closeMenu() {
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
            self.topMenuConstraint.constant = -self.menuView.frame.size.height + CGFloat(20) + self.statusBarHeight
            self.bottomToggleConstraint.constant = 8
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func openMenu() {
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
            self.topMenuConstraint.constant = CGFloat(0)
            self.bottomToggleConstraint.constant = self.menuView.frame.size.height - self.toggleButton.frame.height - self.originalConstraint
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
}

