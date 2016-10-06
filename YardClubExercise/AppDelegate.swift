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
    
    var tabBarController: UITabBarController?
    
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
        UIBarButtonItem.appearance().setTitlePositionAdjustment(UIOffset(horizontal: 0.0, vertical: 30), for: UIBarMetrics.default)
        
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.tabBarController = UITabBarController(nibName: nil, bundle: nil)
        self.tabBarController?.delegate = self

        self.window!.rootViewController = self.tabBarController
        self.window?.makeKeyAndVisible()
     
        let requestViewController = RequestViewController()
        requestViewController.title = "REQUEST \nEQUIPMENT\n"

 
        //NSLocalizedString(@"Now\nPlaying", nil) forState:UIControlStateNormal]
        
//        requestViewController.tabBarItem = UITabBarItem(title: NSLocalizedString("Request \n Equp", comment: "lol"), image: nil, selectedImage: nil)
//        
        
        
        
        
        let requestNav: UINavigationController = UINavigationController(rootViewController: requestViewController)
        
        let activeRentalViewController = ActiveRentalViewController()
        activeRentalViewController.title = "ACTIVE RENTALS"
        activeRentalViewController.tabBarItem = UITabBarItem(title: "ACTIVE RENTALS", image: nil, selectedImage: nil)
        let activeRentalNav: UINavigationController = UINavigationController(rootViewController: activeRentalViewController)
        
        // Add navigation controllers/view controllers
        self.tabBarController?.viewControllers = [requestNav, activeRentalNav]
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("didSelectViewController: \(viewController.title) ?")
    }
}

