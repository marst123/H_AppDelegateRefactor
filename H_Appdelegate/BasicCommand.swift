//
//  BasicCommand.swift
//  AAAAAA
//
//  Created by Mac on 2022/2/17.
//

import Foundation
import UIKit

// 抽象命令
protocol Command {
    func execute()
}

// 发布对象:
class AllCommand {
    var build: [Command] {
        return [WindowCommand(), ConfigCommand(), LogCommand(), RegisterCommand()]
    }
}


// 接收对象
class WindowCommand: Command {
    
    var window: UIWindow?

    // 实现命令
    func execute() {
        let vc = ViewController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        window?.rootViewController = vc
    }
}

class ConfigCommand: Command {
    func execute() {
        
    }
}

class LogCommand: Command {
    func execute() {
        
    }
}

class RegisterCommand: Command {
    func execute() {
        
    }
}

