//
//  ViewController.swift
//  textView
//
//  Created by Maryna Veksler on 12/26/19.
//  Copyright © 2019 Maryna Veksler. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

   func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      print(info)
   
     
     
     if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imgView.contentMode = .scaleAspectFit
            imgView.image = pickedImage
        }
     
        dismiss(animated: true, completion: nil)
       }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
    }

    @IBOutlet weak var imgView: UIImageView!
    
    @IBAction func addImage(_ sender: Any) {
        let imgController = UIImagePickerController.init()
        
        imgController.delegate = self
        present(imgController, animated: true){
            
        }
    }
       

    
    
    @IBOutlet weak var txtField: UITextView!
    
    @IBOutlet weak var txtUserName: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        txtUserName.becomeFirstResponder()
        txtUserName.delegate = self
        txtPassword.delegate = self
        txtField.delegate = self
        //assigning the gesture to the hide keyboard function
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    //hide keyboard input
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
    func textViewDidBeginEditing(_ textView: UITextView) {

    }
    func textViewDidEndEditing(_ textView: UITextView) {
    
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
     
    }
    
    func  textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String)  -> Bool{
        if string == "\n"{
            textField.resignFirstResponder()
            return false
        }
        
        if string == " " && txtUserName == textField {
            textField.backgroundColor = .red
            return false //means rejecting any space
        }else{
            textField.backgroundColor = .yellow
        return true
            
        }
    }
    

}

