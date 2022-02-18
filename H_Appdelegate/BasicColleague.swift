//
//  TeamMediatorFuncation.swift
//  AAAAAA
//
//  Created by Mac on 2022/2/14.
//

import Foundation
import UIKit

class WindowObjc: LaunchOptionsColleague {
    var id: String
    
    var window: UIWindow?
    
    init() {
        self.id = "window窗口"
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) {
        let vc = ViewController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        window?.rootViewController = vc
    }
    
    
}


class RemoteObjc: RemoteNotificationsDeviceTokenColleague {
    var id: String
    
    init() {
        self.id = ""
    }
        
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    }
    
}

class UserInfoObjc: RemoteNotificationsUserInfoColleague {
    var id: String
        
    init() {
        self.id = ""
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
    }
    
}

