//
//  OtherDetailViewController.swift
//  NavigationProgrammatically
//
//  Created by Maryna Veksler on 12/23/19.
//  Copyright © 2019 Maryna Veksler. All rights reserved.
//

import UIKit

class OtherDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemTeal
        createAnotherButton()
    }
    
    @IBAction func goBack(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
        
        //pop to root view controller
    }
    func createAnotherButton(){
        
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x:80, y: 600, width: 200, height: 150)
        btn.setTitle("Open other details", for: .normal)
        btn.backgroundColor = .blue
        btn.addTarget(self, action: #selector(btnAnotherClicked), for: .touchUpInside)
        
        view.addSubview(btn)
    }
    @ objc func btnAnotherClicked(){
        //open detail pragrammatically
        
        let st = UIStoryboard.init(name: "AnotherDetailViewController", bundle: nil)
        let dvc = st.instantiateViewController(withIdentifier: "AnotherDetailViewController")
        
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
