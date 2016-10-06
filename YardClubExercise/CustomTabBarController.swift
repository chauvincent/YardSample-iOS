//
//  CustomTabBarController.swift
//  YardClubExercise
//
//  Created by Vincent Chau on 10/6/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController, UITabBarControllerDelegate {

    var tabItems = ["REQUEST\nEQUIPTMENT", "ACTIVE\nRENTAL", "OPEN\nREQUESTS", "MY YARD"]
    var allLabels: [UILabel] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let requestViewController = RequestViewController()
        
        let requestNav: UINavigationController = UINavigationController(rootViewController: requestViewController)
        
        let activeRentalViewController = ActiveRentalViewController()
        let activeRentalNav: UINavigationController = UINavigationController(rootViewController: activeRentalViewController)
        
        
        
        let openRequestRentalViewController = OpenRequestViewController()
        let openRequestRentalNav: UINavigationController = UINavigationController(rootViewController: openRequestRentalViewController)
        
        
        let myYardViewController = MyYardViewController()
        let myYardNav: UINavigationController = UINavigationController(rootViewController: myYardViewController)
        
        self.tabBar.backgroundColor = UIColor.black
        
        self.viewControllers = [requestNav, activeRentalNav, openRequestRentalNav, myYardNav]
        
        self.setupLabels()
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("selected")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    func setupLabels()
    {
        let windowBounds = UIScreen.main.bounds
        let originY = windowBounds.size.height - 32.0
        let labelWidth = windowBounds.size.width / CGFloat(tabItems.count)
        
        for (index, element) in self.tabItems.enumerated()
        {
            let originX = CGFloat(index) * labelWidth
            let label = UILabel(frame: CGRect(x: originX, y: originY, width: labelWidth, height: 32.0))
            label.text = element
            label.numberOfLines = 2
            label.textColor = UIColor.white
            label.font = UIFont (name: "Helvetica Neue", size: 10)
            label.textAlignment = .center
            label.adjustsFontSizeToFitWidth = true
            label.minimumScaleFactor = 0.5
            self.view.addSubview(label)
        }

    }

    
}
