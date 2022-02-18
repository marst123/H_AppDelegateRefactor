//
//  AppDelegate.swift
//  H_Appdelegate
//
//  Created by 维妮熊 on 2022/2/17.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        AppDelegateMediator.defaultMediator.application(application, didFinishLaunchingWithOptions: launchOptions)
        AppDelegateMediator.defaultMediator.life(launchOptions)
        
        LaunchOptionsMediator.defaultMediator.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        
        AllCommand().build.enumerated().forEach { (command) in
            command.element.execute()
        }
        
        return true
    }




}

