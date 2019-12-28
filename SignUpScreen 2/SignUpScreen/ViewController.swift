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
    var txtNew : UITextField?


  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    createProfileImgView()
    createUserNameTextField()
    createPasswordTextField()
    createMobTextField()
    createNewTextField()
  }
  
  func createProfileImgView(){
    
    let img = UIImage(named: "imgProfile")
    imgProfileView = UIImageView.init(image: img)
    view.addSubview(imgProfileView!)
    
    //vimp
    imgProfileView!.translatesAutoresizingMaskIntoConstraints = false
    
    imgProfileView?.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
    //vimp
    imgProfileView?.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
    
    imgProfileView?.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
    
  }
  
  func createUserNameTextField(){
    
    txtUserName = UITextField.init()
    txtUserName!.backgroundColor = UIColor.green
    txtUserName!.placeholder = "Username"
    txtUserName!.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(txtUserName!)

    //V:[imgProfileView]-20-[txtUserName]
    let margin = 30
    
    let viewDictionary = ["view" : view, "imgProfileView" : imgProfileView, "txtUserName" : txtUserName]
    let marginDict = ["margin" : margin]
    
    let cons = NSLayoutConstraint.constraints(withVisualFormat: "V:[imgProfileView]-margin-[txtUserName]", options: [], metrics: marginDict, views: viewDictionary as! [String : UIView])
    view.addConstraints(cons)
    
    //vimp
    let constraintLeft = NSLayoutConstraint.init(item: txtUserName!, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1.0, constant: 20)
    view.addConstraint(constraintLeft)
    //vimp
    
    //vimp
    let constraintRight = NSLayoutConstraint.init(item: txtUserName!, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1.0, constant: -20)
    view.addConstraint(constraintRight)
    //vimp
  }
  
  func createPasswordTextField(){
    
    txtPassword = UITextField.init()
    txtPassword!.backgroundColor = UIColor.green
    txtPassword!.placeholder = "Passworf"
    txtPassword!.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(txtPassword!)

    
    //vimp
    let constraintTop = NSLayoutConstraint.init(item: txtPassword!, attribute: .top, relatedBy: .equal, toItem: txtUserName!, attribute: .bottom, multiplier: 1.0, constant: 20)
    view.addConstraint(constraintTop)
    //vimp
    
    //vimp
    let constraintLeft = NSLayoutConstraint.init(item: txtPassword!, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1.0, constant: 20)
    view.addConstraint(constraintLeft)
    //vimp
    
    //vimp
    let constraintRight = NSLayoutConstraint.init(item: txtPassword!, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1.0, constant: -20)
    view.addConstraint(constraintRight)
    //vimp
  }
  
  func createMobTextField(){
    
    txtMob = UITextField.init()
    txtMob!.backgroundColor = UIColor.green
    txtMob!.placeholder = "Mob"
    txtMob!.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(txtMob!)

    
    //vimp
    let constraintTop = NSLayoutConstraint.init(item: txtMob!, attribute: .top, relatedBy: .equal, toItem: txtPassword!, attribute: .bottom, multiplier: 1.0, constant: 20)
    view.addConstraint(constraintTop)
    //vimp
    
    //vimp
    let constraintLeft = NSLayoutConstraint.init(item: txtMob!, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1.0, constant: 20)
    view.addConstraint(constraintLeft)
    //vimp
    
    //vimp
    let constraintRight = NSLayoutConstraint.init(item: txtMob!, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1.0, constant: -20)
    view.addConstraint(constraintRight)
    //vimp
    
  }

    func createNewTextField(){
        txtNew = UITextField.init()
        txtNew!.backgroundColor = UIColor.green
        txtNew!.placeholder = "New"
        txtNew!.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(txtNew!)
        //V:[imgProfileView]-20-[txtUserName]
        let margin = 20
        
        let viewDictionary = ["view" : view, "txtMob" : txtMob, "txtNew" : txtNew]
        let marginDict = ["margin" : margin]
        
        let consV = NSLayoutConstraint.constraints(withVisualFormat: "V:[txtMob]-margin-[txtNew]", options: [], metrics: marginDict, views: viewDictionary as! [String : UIView])
        view.addConstraints(consV)
        //|-50-[purpleBox]-50-|
        let cons = NSLayoutConstraint.constraints(withVisualFormat: "|-margin-[txtNew]-margin-|", options: [], metrics: marginDict, views: viewDictionary as! [String : UIView])
        view.addConstraints(cons)
        
    }

}

