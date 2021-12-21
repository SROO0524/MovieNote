//
//  AppDelegate.swift
//  MovieNote
//
//  Created by 김믿음 on 2021/12/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window:UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window?.rootViewController = MainTabbarController()
        return true
    }



}

