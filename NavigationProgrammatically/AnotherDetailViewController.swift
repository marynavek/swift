//
//  AnotherDetailViewController.swift
//  NavigationProgrammatically
//
//  Created by Maryna Veksler on 12/23/19.
//  Copyright © 2019 Maryna Veksler. All rights reserved.
//

import UIKit

class AnotherDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .purple
        createNewButton()
    }
    
    @IBAction func goRoot(_ sender: Any) {
        
        navigationController?.popToRootViewController(animated: true)
        
        //pop to root view controller
    }
    
    
    func createNewButton(){
        
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x:80, y: 600, width: 200, height: 150)
        btn.setTitle("Open other details", for: .normal)
        btn.backgroundColor = .blue
        btn.addTarget(self, action: #selector(btnNewClicked), for: .touchUpInside)
        
        view.addSubview(btn)
    }
    @ objc func btnNewClicked(){
        //open detail pragrammatically
        
        let st = UIStoryboard.init(name: "newViewController", bundle: nil)
        let dvc = st.instantiateViewController(withIdentifier: "newViewController")
        
        navigationController?.pushViewController(dvc, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
