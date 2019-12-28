//
//  ViewController.swift
//  AutoLayout
//
//  Created by Maryna Veksler on 12/27/19.
//  Copyright © 2019 Maryna Veksler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var height: NSLayoutConstraint!
    @IBOutlet weak var topY: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnClicked(_ sender: Any) {
        //each click allows to move the object with topY constraints up-down by y-axis
        //get ref to y space/vetical space of orange view from top. lets say variable name is topY
    //    topY = topY + 10
        
        UIView.animate(withDuration: 0.2){
            self.topY.constant = self.topY.constant+10
            //needed property for smooth animations
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func decrementBtnClicked(_ sender: Any) {
        UIView.animate(withDuration: 0.2){
        self.topY.constant = self.topY.constant-10
        //needed property for smooth animations
        self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func changeHeight(_ sender: Any) {
        UIView.animate(withDuration: 0.2){
        self.height.constant = self.height.constant+10
        //needed property for smooth animations
        self.view.layoutIfNeeded()
        }
    }
}

