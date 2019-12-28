//
//  ViewController.swift
//  calculator
//
//  Created by Maryna Veksler on 12/21/19.
//  Copyright © 2019 Maryna Veksler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//functions declaration
    func add(num1 : Float, num2 : Float) -> Float{
        return (num1 + num2)
    }
    func subtract(num1 : Float, num2 : Float) -> Float{
        return (num1 - num2)
    }
    func multiply(num1 : Float, num2 : Float) -> Float{
        return (num1 * num2)
    }
    func divide(num1 : Float, num2 : Float) -> Float{
        return (num1 / num2)
    }
    func modulo(num1 : Int, num2 : Int) -> Int{
        return (num1 % num2)
    }
    
//function to check for float point
    func floatP (result : Float) -> String {
        var resultF : String
        var check : Float = result - Float(Int(result))
        if check != 0 {
            resultF = String(result)
        } else{
            resultF = String(Int(result))
        }
        return resultF
    }
    
    enum operations : Int{
    
    case add = 16
    case subtract = 15
    case multiply = 14
    case divide = 13
    case modulo = 12
    case def = 0
    }
    
    var dotcontrol : NSInteger = 0
    var signcontrol : NSInteger = 0
    
    var num1 : Float = 0
    var num2 : Float = 0
    
    var operation = operations.def
    var answer : Float = 0.0
    var keepA : Float = 0.0
    
    var currNum : String = ""
    
    func saveNum1(){
        if currNum != ""{
        dotcontrol = 0
        signcontrol = 0
        if let num = Float(currNum){
            num1 = num
            currNum = ""
            showNumbers()
        } else {
            currNum = ""
            showNumbers()
            let alert1 = UIAlertController(title: "Error", message: "Invalid argument",preferredStyle: .alert)
            let cancelAction1 = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert1.addAction(cancelAction1)
            present(alert1, animated: true)
        }
        }else {
            dotcontrol = 0
            signcontrol = 0
            
                num1 = keepA
                currNum = ""
                showNumbers()
        }
       }
    
    @IBAction func equal (_ sender : UIButton){
        dotcontrol = 0
        signcontrol = 0
        if let num = Float(currNum){
            num2 = num
            currNum = ""
            showNumbers()
        }else {
            let alert2 = UIAlertController(title: "Error", message: "Invalid argument, strat over!",preferredStyle: .alert)
            let cancelAction1 = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert2.addAction(cancelAction1)
            present(alert2, animated: true)
        }
        switch operation {
        case .modulo :
            answer = Float(modulo(num1: Int(num1), num2: Int(num2)))
            currNum = floatP(result: answer)
        case .divide :
            if num2 == 0.0 {
                currNum = ""
                showNumbers()
                let alert = UIAlertController(title: "Error", message: "Cannot divide by zero",preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alert.addAction(cancelAction)
                present(alert, animated: true)
            }else{
                answer = divide(num1: num1, num2: num2)
                currNum = String(answer)
            }
        case .multiply:
            answer = multiply(num1: num1, num2: num2)
            currNum = floatP(result: answer)
        case .subtract:
            answer = subtract(num1: num1, num2: num2)
            currNum = floatP(result: answer)
        case .add:
            answer = add(num1: num1, num2: num2)
            currNum = floatP(result: answer)
        default:
            print("The operation is not recognized")
        }
        keepA = answer
        num1 = 0
        num2 = 0
        showNumbers()
        answer = 0.0
        currNum = ""

    }
    
   @IBAction func setOperation(_ sender : UIButton){
        if sender.tag >= 12 && sender.tag <= 16{
            switch sender.tag {
            case operations.add.rawValue:
                operation = operations.add
            case operations.multiply.rawValue:
                operation = operations.multiply
            case operations.divide.rawValue :
                operation = operations.divide
            case operations.subtract.rawValue :
                operation = operations.subtract
            case operations.modulo.rawValue :
                operation = operations.modulo
            default:
                operation = operations.def
            }
            saveNum1()
        }
        if sender.tag == -2 {
             currNum = ""
            showNumbers()
        }
    }
        

    @IBOutlet weak var output: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showNumbers()
        view.backgroundColor = .black
    }
    
    func showNumbers (){
        output.text = currNum
    }
    
    @IBAction func pressNumber (_ sender : UIButton){
        if sender.tag >= 0 && sender.tag <= 10 {
            if sender.tag == 10{
                showNumbers()
                if dotcontrol == 0 {
                    currNum += "."
                    showNumbers()
                    print(currNum)
                    dotcontrol = 1
                }
                else if dotcontrol == 1 {
                    if let i = currNum.firstIndex(of: "."){
                            currNum.remove(at: i )
                        print(currNum)
                    }
                    showNumbers()
                    dotcontrol = 0
                }
            }
            else{
            currNum += String(sender.tag)
            showNumbers()
            }
        }
       else if sender.tag == 11 {
            let firstIndex: String.Index = currNum.startIndex
            if signcontrol == 0 {
                if firstIndex == nil{
                    currNum += "-"
                    showNumbers()
                }
                else{
                    currNum.insert("-", at: firstIndex )
                        showNumbers()
                }
                signcontrol = 1
            }
            else if signcontrol == 1{
                currNum.remove(at: firstIndex)
                showNumbers()
                signcontrol = 0
            }
        }
    }
}

