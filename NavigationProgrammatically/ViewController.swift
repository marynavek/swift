//
//  ViewController.swift
//  NavigationProgrammatically
//
//  Created by Maryna Veksler on 12/23/19.
//  Copyright © 2019 Maryna Veksler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.green
        
        createButton()
        createOtherButton()

    }
    
    func createButton(){
        
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x:80, y: 200, width: 200, height: 150)
        btn.setTitle("Open details", for: .normal)
        btn.backgroundColor = .blue
        btn.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
        
        view.addSubview(btn)
    }

    @ objc func btnClicked(){
        //open detail pragrammatically
        
        let dvc = DetailViewController()
        navigationController?.pushViewController(dvc, animated: true)
    }
    
    func createOtherButton(){
        
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x:80, y: 400, width: 200, height: 150)
        btn.setTitle("Open other details", for: .normal)
        btn.backgroundColor = .blue
        btn.addTarget(self, action: #selector(btnOtherClicked), for: .touchUpInside)
        
        view.addSubview(btn)
    }
    @ objc func btnOtherClicked(){
        //open detail pragrammatically
        
        let sb = UIStoryboard.init(name: "OtherDetailViewController", bundle: nil)
        let dvc = sb.instantiateViewController(withIdentifier: "OtherDetailViewController")
        
        navigationController?.pushViewController(dvc, animated: true)
    }
    
    
    

    
}

