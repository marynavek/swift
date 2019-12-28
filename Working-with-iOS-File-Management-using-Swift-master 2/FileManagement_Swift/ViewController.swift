//
//  ViewController.swift
//  FileManagement_Swift
//
//  Created by TheAppGuruz-New-6 on 19/08/14.
//  Copyright (c) 2014 TheAppGuruz-New-6. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIAlertViewDelegate
{
    var fileManagaer:FileManager?
    var documentDir:NSString?
    var filePath:NSString?


    override func viewDidLoad()
    {
        super.viewDidLoad()
        fileManagaer=FileManager.default
      
        //always the same initialization, no matter the program
      let dirPaths:NSArray=NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
        documentDir=dirPaths[0] as? NSString
        print("path : \(documentDir)")
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnRemoveFile(sender: AnyObject)
    {
      filePath=documentDir?.appendingPathComponent("file1.txt") as! NSString
      
      do{
        try fileManagaer?.removeItem(atPath: filePath as! String)
        self.showSuccessAlert(titleAlert: "Message", messageAlert: "File removed successfully.")

      }catch let error{
        print("some error")
        self.showSuccessAlert(titleAlert: "Message", messageAlert: "Some error found.")

      }
    }
    
    @IBAction func btnEqualityClicked(sender: AnyObject)
    {
      var filePath1=documentDir?.appendingPathComponent("file1.txt")
      var filePath2=documentDir?.appendingPathComponent("file2.txt")
        
      if((fileManagaer? .contentsEqual(atPath: filePath1!, andPath: filePath2!)) != nil)
        {
          self.showSuccessAlert(titleAlert: "Message", messageAlert: "Files are equal.")
        }
        else
        {
          self.showSuccessAlert(titleAlert: "Message", messageAlert: "Files are not equal.")
        }
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnMoveClicked(sender: AnyObject)
    {
      var oldFilePath:String=documentDir!.appendingPathComponent("file1.txt") as String
      var newFilePath:String=documentDir!.appendingPathComponent("/folder1/file1.txt") as String
        var err :NSError?
      
      do{
      try fileManagaer?.moveItem(atPath: oldFilePath, toPath: newFilePath)
        self.showSuccessAlert(titleAlert: "Success", messageAlert: "File moved successfully")

      }catch let error{
        
        print("errorrr \(error)")
        self.showSuccessAlert(titleAlert: "Fail", messageAlert: "errorrr \(error)" as NSString)

      }
      
    }
    
    @IBAction func btnWriteFileClicked(sender: AnyObject)
    {
        var content:NSString=NSString(string: "helllo how are you?")
      var fileContent:NSData=content.data(using: String.Encoding.utf8.rawValue)! as NSData
      fileContent .write(toFile: documentDir!.appendingPathComponent("file1.txt"), atomically: true)
      self.showSuccessAlert(titleAlert: "Success", messageAlert: "Content written successfully")
    }
    
    @IBAction func btnCreateFileClicked(sender: AnyObject)
    {
        var error: NSError? = nil
      filePath=documentDir?.appendingPathComponent("file1.txt") as! NSString
      fileManagaer?.createFile(atPath: filePath! as String, contents: nil, attributes: nil)
        
      filePath = documentDir?.appendingPathComponent("file2.txt") as! NSString
      fileManagaer?.createFile(atPath: filePath! as String, contents: nil, attributes: nil)
        
      self.showSuccessAlert(titleAlert: "Success", messageAlert: "File created successfully")
    }
    
    @IBAction func btnCreateDirectoryClicked(sender: AnyObject)
    {
      filePath=documentDir?.appendingPathComponent("/folder1") as! NSString
//        fileManagaer?.createDirectoryAtPath(filePath! as String, withIntermediateDirectories: false, attributes: nil, error: nil)
      do{
      try fileManagaer?.createDirectory(atPath: filePath! as String, withIntermediateDirectories: false, attributes: nil)
        self.showSuccessAlert(titleAlert: "Success", messageAlert: "Directory created successfully")

      }
      catch let error{
        self.showSuccessAlert(titleAlert: "Fail", messageAlert: "Falied")

      }
    }
    
    @IBAction func btnReadFileClicked(sender: AnyObject)
    {
      filePath=documentDir?.appendingPathComponent("/file1.txt") as! NSString
        var fileContent:NSData?
      fileContent=fileManagaer?.contents(atPath: filePath! as String) as! NSData
      var str:NSString=NSString(data: fileContent! as Data, encoding: String.Encoding.utf8.rawValue)!
      self.showSuccessAlert(titleAlert: "Success", messageAlert: "data : \(str)" as NSString as NSString)
    }
    
    @IBAction func btnCopyFileClicked(sender: AnyObject)
    {
      let originalFile=documentDir?.appendingPathComponent("file1.txt")
      let copyFile=documentDir?.appendingPathComponent("copy.txt")
//        fileManagaer?.copyItemAtPath(originalFile!, toPath: copyFile!, error: nil)
      do{
        try fileManagaer?.copyItem(atPath: originalFile!, toPath: copyFile!)
        self.showSuccessAlert(titleAlert: "Success", messageAlert:"File copied successfully")

      }
      catch let error{
        self.showSuccessAlert(titleAlert: "FAIL", messageAlert:"File copied Failed")

      }
    }
    
    @IBAction func btnDirectoryContentsClicked(sender: AnyObject)
    {
//        var arrDirContent=fileManagaer!.contentsOfDirectoryAtPath(documentDir as! String, error: &error)
      do{
        var arrDirContent =  try fileManagaer?.contentsOfDirectory(atPath: documentDir as! String)
        self.showSuccessAlert(titleAlert: "Success", messageAlert: "Content of directory \(arrDirContent)" as NSString)

      }catch let error{
        self.showSuccessAlert(titleAlert: "FAIL", messageAlert: "FAIL")

      }
    }
    
    func showSuccessAlert(titleAlert:NSString,messageAlert:NSString)
    {
//      var alert:UIAlertController=UIAlertController(title:titleAlert as String, message: messageAlert as String, preferredStyle: UIAlertControllerStyle: .al)
      var alert = UIAlertController(title: titleAlert as String, message: messageAlert as String, preferredStyle: .alert)
      var okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
        {
                UIAlertAction in
        }
        alert.addAction(okAction)
      if UIDevice.current.userInterfaceIdiom == .phone
        {
          self.present(alert, animated: true, completion: nil)
        }
    }

    @IBAction func btnFilePermissionClicked(sender: AnyObject)
    {
      filePath=documentDir?.appendingPathComponent("file1.txt") as! NSString
        var filePermissions:NSString = ""
    
      if((fileManagaer?.isWritableFile(atPath: filePath! as String)) != nil)
        {
//          filePermissions=filePermissions.appendingappending("file is writable. ") as NSString
          
          filePermissions = filePermissions.appending("file is writable. ") as NSString
        }
      if((fileManagaer?.isReadableFile(atPath: filePath! as String)) != nil)
        {
          filePermissions=filePermissions.appending("file is readable. ") as NSString
        }
      if((fileManagaer?.isExecutableFile(atPath: filePath! as String)) != nil)
        {
          filePermissions=filePermissions.appending("file is executable.") as NSString
        }
      self.showSuccessAlert(titleAlert: "Success", messageAlert: "\(filePermissions)" as NSString)
    }
}

