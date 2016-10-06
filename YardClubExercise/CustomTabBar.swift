//
//  CustomTabBarController.swift
//  YardClubExercise
//
//  Created by Vincent Chau on 10/6/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

import UIKit

class CustomTabBar: UITabBarController, UITabBarControllerDelegate
{
    
    var controllerTitles = ["REQUEST EQUIPMENT", "ACTIVE RENTAL", "OPEN REQUESTS", "MY YARD"]
    var tabBarTitles = ["REQUEST\nEQUIPMENT", "ACTIVE\nRENTAL", "OPEN\nREQUESTS", "MY YARD"]
    var allLabels: [UILabel] = []
    var allHairline: [UIView] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupView()
        setupControllers()
        setupLabels()
    
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()

    }

    func setupView()
    {
        self.tabBar.backgroundColor = UIColor.black
        self.delegate = self
    }
    
    func setupControllers()
    {
        let requestViewController = RequestViewController()
        let activeRentalViewController = ActiveRentalViewController()
        let openRequestRentalViewController = OpenRequestViewController()
        let myYardViewController = MyYardViewController()
    
        self.viewControllers = [requestViewController, activeRentalViewController, openRequestRentalViewController, myYardViewController]
    
        navigationItem.title = "\(controllerTitles.first!)"
    }
    
    func setupLabels()
    {
        let windowBounds = UIScreen.main.bounds
        let labelSize = self.tabBar.frame.size.height
        let originY = windowBounds.size.height - labelSize
        let labelWidth = windowBounds.size.width / CGFloat(tabBarTitles.count)
        
        for (index, element) in self.tabBarTitles.enumerated()
        {
            // Set Up Bar Item Container
            let originX = CGFloat(index) * labelWidth
            let containerView = UIView(frame: CGRect(x: originX, y: originY, width: labelWidth, height: labelSize))
            containerView.backgroundColor = UIColor.clear
            self.view.addSubview(containerView)
            containerView.isUserInteractionEnabled = false
            
            // Set Up Label For Tab Bar Item
            let label = UILabel(frame: .zero)
            containerView.addSubview(label)
            label.text = element
            label.numberOfLines = 2
            label.textColor = UIColor.white
            label.font = UIFont (name: "OpenSans-Bold", size: 11)!
            label.textAlignment = .center
            label.adjustsFontSizeToFitWidth = true
            label.minimumScaleFactor = 0.5
            label.sizeToFit()
            label.translatesAutoresizingMaskIntoConstraints = false
            
            // Label Constraints
            label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
            
            // Add Hairline
            let underlineWidth = label.intrinsicContentSize.width
            let underlineView = UIView()
            underlineView.backgroundColor = YELLOW_COLOR
            label.addSubview(underlineView)
            underlineView.translatesAutoresizingMaskIntoConstraints = false;            
            underlineView.heightAnchor.constraint(equalToConstant: 3.0).isActive = true
            underlineView.bottomAnchor.constraint(equalTo: label.bottomAnchor, constant: 2.0).isActive = true
            underlineView.widthAnchor.constraint(equalToConstant:underlineWidth).isActive = true
            underlineView.centerXAnchor.constraint(equalTo: label.centerXAnchor).isActive = true
            
            self.allHairline.append(underlineView)
            self.allLabels.append(label)
        }
        setSelected(index: 0)
        
    }
    
// MARK: - <UITabBarControllerDelegate>
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController)
    {
        setSelected(index: self.selectedIndex)
    }

// MARK: - Helpers
    
    func setSelected(index: Int)
    {
        for (index, label) in self.allLabels.enumerated()
        {
            if index == selectedIndex
            {
                label.textColor = YELLOW_COLOR
                self.allHairline[index].isHidden = false
            }
            else
            {
                label.textColor = UIColor.white
                self.allHairline[index].isHidden = true
            }
        }
    }
    
    

}
