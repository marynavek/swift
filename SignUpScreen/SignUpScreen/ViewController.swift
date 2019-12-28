//
//  ViewController.swift
//  SignUpScreen
//
//  Created by Haider Khan on 12/27/19.
//  Copyright © 2019 rjt.Alok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var imgProfileView : UIImageView?
  var txtUserName : UITextField?
  var txtPassword : UITextField?
  var txtMob : UITextField?
    


  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    createProfileImgView()
    createUserNameTextField()
    createPasswordTextField()
    createMobTextField()
  }
  
  func createProfileImgView(){
    
    let img = UIImage(named: "imgProfile")
    imgProfileView = UIImageView.init(image: img)
    view.addSubview(imgProfileView!)
    imgProfileView!.translatesAutoresizingMaskIntoConstraints = false
    //anchor way constraints
    imgProfileView?.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
    imgProfileView?.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
    imgProfileView?.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
    
    
//    constraint(object: imgProfileView!, relatedTo: view?.topAnchor)
    
    
//hard coded constraints using methods

//    imgProfileView!.translatesAutoresizingMaskIntoConstraints = false
//    let constraintTop = NSLayoutConstraint.init(item: imgProfileView!, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 20)
//    view.addConstraint(constraintTop)
//    //vimp
//
//    //vimp
//    let constraintLeft = NSLayoutConstraint.init(item: imgProfileView!, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1.0, constant: 20)
//    view.addConstraint(constraintLeft)
//    //vimp
//
//    //vimp
//    let constraintRight = NSLayoutConstraint.init(item: imgProfileView!, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1.0, constant: -20)
//    view.addConstraint(constraintRight)
//    //vimp
//
  }
  
  func createUserNameTextField(){
    
    txtUserName = UITextField.init()
    txtUserName!.backgroundColor = UIColor.green
    txtUserName!.placeholder = "Username"
    view.addSubview(txtUserName!)
    //V:[imgProfileView]-20-[txtUserName]
//    let viewDictionary = ["view" : view, "imgProfileView" : imgProfileView, "txtUserName" : txtUserName]
//    let marginDic = ["margin" : 20]
//    let cons = NSLayoutConstraint.constraints(withVisualFormat: "V:[imgProfileView]-margin-[txtUserName]", options: [], metrics: marginDic, views: viewDictionary as! [String : UIView])
//    view.addConstraints(cons)
    
    
    constraint(object: txtUserName!, relatedTo: imgProfileView!)
    }
  
  func createPasswordTextField(){
    
    txtPassword = UITextField.init()
    txtPassword!.backgroundColor = UIColor.green
    txtPassword!.placeholder = "Passworf"
    view.addSubview(txtPassword!)
    constraint(object: txtPassword!, relatedTo: txtUserName!)
  }
  
  func createMobTextField(){
    
    txtMob = UITextField.init()
    txtMob!.backgroundColor = UIColor.green
    txtMob!.placeholder = "Mob"
    view.addSubview(txtMob!)
    constraint(object: txtMob!, relatedTo: txtPassword!)
    
  }


    func constraint(object: UIView, relatedTo: UIView){

        object.translatesAutoresizingMaskIntoConstraints = false

        let constraintTop = NSLayoutConstraint.init(item: object, attribute: .top, relatedBy: .equal, toItem: relatedTo, attribute: .bottom, multiplier: 1.0, constant: 20)
        view.addConstraint(constraintTop)

        let constraintLeft = NSLayoutConstraint.init(item: object, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1.0, constant: 20)
        view.addConstraint(constraintLeft)
        //vimp

        //vimp
        let constraintRight = NSLayoutConstraint.init(item: object, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1.0, constant: -20)
        view.addConstraint(constraintRight)
        //vimp
    }
}

