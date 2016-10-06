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
    
    var tabBarController: CustomTabBarController?

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        self.setupTabBar()
        self.setupNav()
        
        return true
    }
    
    func setupNav()
    {
        UINavigationBar.appearance().barTintColor = UIColor.black
        UINavigationBar.appearance().tintColor = UIColor.yellow

        UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName : UIFont.systemFont(ofSize: 20), NSForegroundColorAttributeName : UIColor.white]

    }

    func setupTabBar()
    {
        
        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName : UIFont.systemFont(ofSize: 16), NSForegroundColorAttributeName : UIColor.white], for: UIControlState.normal)
        UITabBar.appearance().barTintColor = UIColor.black
        UITabBar.appearance().tintColor = UIColor.yellow
        
        //UIBarButtonItem.appearance().setTitlePositionAdjustment(UIOffset(horizontal: 0.0, vertical: 30), for: UIBarMetrics.default)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.tabBarController = CustomTabBarController()
        self.tabBarController?.delegate = self

        self.window!.rootViewController = self.tabBarController
        self.window?.makeKeyAndVisible()
     

    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("didSelectViewController: \(viewController.title) ?")
    }
}

