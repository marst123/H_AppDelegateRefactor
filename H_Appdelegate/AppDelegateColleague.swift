//
//  AppDelegateFuncation.swift
//  AAAAAA
//
//  Created by Mac on 2022/2/7.
//

import Foundation
import UIKit


class WindowColleague: LifeAppDelegate {

    var window: UIWindow?
    
    func onAppDidFinishLaunching(options: [UIApplication.LaunchOptionsKey : Any]?) {
        let vc = ViewController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        window?.rootViewController = vc
    }
    
}

class RegisterColleague: LifeAppDelegate {

    var window: UIWindow?
    
    func onAppDidFinishLaunching(options: [UIApplication.LaunchOptionsKey : Any]?) {
        
    }
    
    func onAppDidEnterBackground() {
        
    }
    
}



