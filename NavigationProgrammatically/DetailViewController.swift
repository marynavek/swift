//
//  DetailViewController.swift
//  NavigationProgrammatically
//
//  Created by Maryna Veksler on 12/23/19.
//  Copyright © 2019 Maryna Veksler. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        // Do any additional setup after loading the view.
    }
    

    @IBAction func goBack(_ sender : UIButton){
        navigationController?.popToRootViewController(animated: true)
    }

}
