//
//  ViewController.swift
//  Batch22_TextFieldDelagete
//
//  Created by Haider Khan on 12/26/19.
//  Copyright © 2019 rjt.Alok. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  
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
    
    present(imgController, animated: true) {
      
    }
    
  }
  
  
  @IBOutlet weak var txtPassword: UITextField!
  @IBOutlet weak var txtUserName: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    print(UserDefaults.standard.value(forKey: "name"))
    print(UserDefaults.standard.value(forKey: "game"))
    
    txtUserName.becomeFirstResponder()
    txtUserName.delegate = self
    txtPassword.delegate = self

    let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(hideKeyboard))
    
    view.addGestureRecognizer(tapGesture)
    
  }
  
  @objc func hideKeyboard(){
    view.endEditing(true)
    
  }
  
  
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
    
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    
  }
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
    //when click on return button in keyboard
    if string == "\n"{
      
      textField.resignFirstResponder()
      return false
    }
    
    
    if string == " " && txtUserName == textField //only handle username, for password keep returning true
    {
      
      textField.backgroundColor = UIColor.red
      return false
    }
    
    textField.backgroundColor = UIColor.green

    return true
  }


}

