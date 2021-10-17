//
//  AppDelegate.swift
//  calculator
//
//  Created by Magic Jammie on 10/11/21.
//  Copyright © 2021 Magic Jammie. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let graph = Graph()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = graph.makeViewController()
        
        
        return true
    }
}

