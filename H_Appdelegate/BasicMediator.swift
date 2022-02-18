//
//  TeamMediator.swift
//  AAAAAA
//
//  Created by Mac on 2022/2/14.
//

import Foundation
import UIKit

protocol Cooperator {
    
    var id: String { get }
}


protocol LaunchOptionsColleague: Cooperator {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
}

protocol RemoteNotificationsDeviceTokenColleague: Cooperator {
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data)
}

protocol RemoteNotificationsUserInfoColleague: Cooperator {
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any])
}

//protocol OpenUrlColleague: Cooperator {
//    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool
//    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool
//}
//
//protocol UserActivityColleague: Cooperator {
//    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool
//}


@objc protocol Mediator {

    /// 完成启动
    @objc optional func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
    
    /// DeviceToken 注册远程通知
    @objc optional func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data)
    
    /// 启动远程通知后台模式, 获取适当的新数据以响应传入的远程通知 (会在调用完RemoteNotificationsWithDeviceToken后调用)
    @objc optional func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any])
    
    /// 从外部返回App (ios9.0+)
    @objc optional func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool
    
    /// 从外部返回App (ios9.0之前, 这个也需要重写)
    @objc optional func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool
    
    /// 应用程序在接受用户活动数据时调用, 并是否处理了该活动
    @objc optional func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool
    
}


class LaunchOptionsMediator: Mediator {
    
    static let defaultMediator = LaunchOptionsMediator([WindowObjc()])
    
    var cooperators: [LaunchOptionsColleague] = []
    
    convenience init(_ arrs: [LaunchOptionsColleague]) {
        self.init()
        cooperators = arrs
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) {
        for cooperator in cooperators {
            print("-------------- \(self)  \(cooperator.id)  ---------------")
            cooperator.application(application, didFinishLaunchingWithOptions: launchOptions)
        }
    }
    
}


class RemoteNotificationsDeviceTokenMediator: Mediator {
    
    static let defaultMediator = RemoteNotificationsDeviceTokenMediator([RemoteObjc()])
    
    var cooperators: [RemoteNotificationsDeviceTokenColleague] = []
    
    convenience init(_ arrs: [RemoteNotificationsDeviceTokenColleague]) {
        self.init()
        cooperators = arrs
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        for cooperator in cooperators {
            print("-------------- \(self)  \(cooperator.id)  ---------------")
            cooperator.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
        }
    }
    
}


class RemoteNotificationsUserInfoMediator: Mediator {
    
    static let defaultMediator = RemoteNotificationsUserInfoMediator([UserInfoObjc()])
    
    var cooperators: [RemoteNotificationsUserInfoColleague] = []
    
    convenience init(_ arrs: [RemoteNotificationsUserInfoColleague]) {
        self.init()
        cooperators = arrs
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        for cooperator in cooperators {
            print("-------------- \(self)  \(cooperator.id)  ---------------")
            cooperator.application(application, didReceiveRemoteNotification: userInfo)
        }
    }
    
}


//class OpenUrlMediator: Mediator {
//
//    static let defaultMediator = OpenUrlMediator()
//
//    var cooperator = OpenUrlObjc()
//
//    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
//        print("-------------- \(self)  \(cooperator.id)  ---------------")
//        return cooperator.application(app, open: url, options: options)
//    }
//
//    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
//        print("-------------- \(self)  \(cooperator.id)  ---------------")
//        return cooperator.application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
//    }
//
//
//}
//
//
//class UserActivityMediator: Mediator {
//
//    static let defaultMediator = UserActivityMediator()
//
//    var cooperator = UserActivityObjc()
//
//    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
//        print("-------------- \(self)  \(cooperator.id)  ---------------")
//        return cooperator.application(application, continue: userActivity, restorationHandler: restorationHandler)
//    }
//
//
//}
