//
//  HomeViewController.swift
//  UIexample
//
//  Created by Maryna Veksler on 12/20/19.
//  Copyright © 2019 Maryna Veksler. All rights reserved.
//

import UIKit

 

class HomeViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    var progLabel : UILabel!
    
    @IBOutlet weak var text: UILabel!
    var progButton : UIButton!
    
    
    fileprivate func createButtonProgrammatically() {
        progButton = UIButton(type: .custom)
        progButton.frame = CGRect(x: 90, y : 500, width: 230, height: 60)
        progButton.setTitle("prog Button", for: .normal)
        progButton.backgroundColor = .yellow
        progButton.layer.cornerRadius = 30
        view.addSubview(progButton)
        progButton.setTitleColor(.red, for: UIControl.State.normal)
        progButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        progButton.addTarget(self, action: #selector(progButtonTapped), for: .touchUpInside)
    }
    
    /* create the constraints with the constant value you want.
     var verticalSpace = NSLayoutConstraint(item: self.imageView, attribute: .Bottom, relatedBy: .Equal, toItem: self.button, attribute: .Bottom, multiplier: 1, constant: 50)

     activate the constraints
    NSLayoutConstraint.activateConstraints([verticalSpace])
    */
    fileprivate func
        createLabelProgrammatically() {
        progLabel = UILabel()
        progLabel.frame = CGRect(x : 90, y: 200, width: 230, height: 20)
        progLabel.text = "Label"
        progLabel.backgroundColor = .orange
        progLabel.layer.cornerRadius = 30
        progLabel.textColor = .black
        view.addSubview(progLabel)
        progLabel.textAlignment = NSTextAlignment.center
        progLabel.font = UIFont.boldSystemFont(ofSize: 15)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        button.setTitle("Go", for: UIControl.State.normal)
        button.backgroundColor = .red
        button.setTitleColor(.yellow, for: UIControl.State.normal)
        button.layer.cornerRadius = 30
        text.backgroundColor = .yellow
        
        createLabelProgrammatically()
        
        createButtonProgrammatically()
    
    }
    
    @objc func progButtonTapped(_ sender: UIButton){
        print("Programmatic button tapped")
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        print("I am trapped")
        let  secondVC = storyboard?.instantiateViewController(identifier: "secondViewController")
        self.present(secondVC!, animated: true)
    }
    
}


