//
//  Utility.swift
//  NavigationProgrammatically
//
//  Created by Maryna Veksler on 12/23/19.
//  Copyright © 2019 Maryna Veksler. All rights reserved.
//

import UIKit

class Utility {

    
   // #warning("parameter name should be generic")
    class func goTo(anyViewController: UIViewController.Type, fromVc :UIViewController){
    
        let vcArrays = fromVc.navigationController?.viewControllers
                   
                   for vc1 in vcArrays! {
                    if type(of:vc1) == anyViewController.self {
                        vc1.navigationController?.popToViewController(vc1, animated: true)
                        break
                       }
                   }
    }
    
}
//class fucntion
//static function
//class function vs static function
//class func and static func in relation with class and struct
//inheritance impaact on class func and static func
class ABC{
    class func m1(){
        
    }
    static func m2(){
        
    }
}

/*
//the static func cannot be overriden
//difference between class and static funcion
//static functions invoked by the class itself, not a function --> cannot be overriden
//dynamically dispatched and can be overridden by subclasses unlike static functions
class Def : ABC{
    override class func m1(){
        
    }
    override static func m2(){
        
    }
}

struct ABCD{
    //cannot use class func inside struct, only static
    class func m1(){
        
    }

    static func m2(){
        
    }
}
*/
