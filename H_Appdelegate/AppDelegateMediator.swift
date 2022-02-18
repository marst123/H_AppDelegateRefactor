//
//  MediatorAppDelegate.swift
//  AAAAAA
//
//  Created by Mac on 2022/1/14.
//

import Foundation
import UIKit

@objc protocol LifeAppDelegate {
    @objc optional func onAppDidFinishLaunching(options: [UIApplication.LaunchOptionsKey: Any]?)
    @objc optional func onAppDidEnterBackground()
    @objc optional func onAppDidBecomeActive()
    @objc optional func onAppWillEnterForeground()
    @objc optional func onAppWillResignActive()
    @objc optional func onAppOpenURL(url: URL, options: [UIApplication.OpenURLOptionsKey : Any])
    @objc optional func onAppDidRegisterForRemoteNotificationsWithDeviceToken(deviceToken: Data)
    @objc optional func onAppWillTerminate()
}


class AppDelegateMediator: NSObject {
    
    static let defaultMediator = AppDelegateMediator([WindowColleague(), RegisterColleague()])
    
    let notification = NotificationCenter.default
    
    var mediators: [LifeAppDelegate]?
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    convenience init(_ array: [LifeAppDelegate]) {
        self.init()
        mediators = array
    }
    
    // 方式一:
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        _ = mediators?.map({ (mediator) in
            mediator.onAppDidFinishLaunching?(options: launchOptions)
        })
    }

    // 方式二:
    func life(_ options: [UIApplication.LaunchOptionsKey: Any]?) {
        notification.addObserver(self, selector: #selector(didFinishLaunching), name: UIApplication.didFinishLaunchingNotification, object: options)/// 程序启动进入初始化
    }
    
    @objc func didFinishLaunching(_ notify: NSNotification) {
        _ = mediators?.map({ (mediator) in
            mediator.onAppDidFinishLaunching?(options: (notify.object as? [UIApplication.LaunchOptionsKey : Any]))
        })
        
    }
    
}

