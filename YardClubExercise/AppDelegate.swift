//
//  AppDelegate.swift
//  YardClubExercise
//
//  Created by Vincent Chau on 10/5/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UITabBarControllerDelegate
{
    
    var tabBarController: CustomTabBar?
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        setupTabBar()
        setupNav()
  
        // Set CustomTabBar as RootViewController
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.tabBarController = CustomTabBar()
        let nav = UINavigationController(rootViewController: self.tabBarController!)
        self.window!.rootViewController = nav
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    func setupNav()
    {
        let YELLOW_COLOR = UIColor(red: 255.0, green: 194.0, blue: 14.0, alpha: 1.0)
        let font = UIFont (name: "OpenSans-Bold", size: 16)!
        UINavigationBar.appearance().barTintColor = UIColor.black
        UINavigationBar.appearance().tintColor = YELLOW_COLOR
        UINavigationBar.appearance().titleTextAttributes =
            [NSFontAttributeName : font, NSForegroundColorAttributeName : UIColor.white]
    }

    func setupTabBar()
    {
        let YELLOW_COLOR = UIColor(red: 255.0, green: 194.0, blue: 14.0, alpha: 1.0)
        UITabBar.appearance().barTintColor = UIColor.black
        UITabBar.appearance().tintColor = YELLOW_COLOR
        UITabBarItem.appearance().setTitleTextAttributes(
            [NSForegroundColorAttributeName : UIColor.white], for: UIControlState.normal)
        
    }
}

