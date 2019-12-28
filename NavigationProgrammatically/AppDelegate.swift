//
//  AppDelegate.swift
//  NavigationProgrammatically
//
//  Created by Maryna Veksler on 12/23/19.
//  Copyright © 2019 Maryna Veksler. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
       
        //root of the app
        //withUIScreen.main.bounds you can get width and height of the screen
/*        let devBounds = UIScreen.main.bounds
        let frame = CGRect(x: 0, y: 0, width: devBounds.width, height: devBounds.height)
        
        //initialize window
        window = UIWindow.init(frame: frame)
        window?.makeKeyAndVisible()
        
        //setup single view controller
        let vc = ViewController.init()
        window?.rootViewController = vc
*/
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

