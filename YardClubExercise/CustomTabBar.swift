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

// MARK: - View Setup
    
    func setupView()
    {
        self.tabBar.backgroundColor = UIColor.black
        self.delegate = self
        
        // Setup Navigation Bar Items
        let callBarButton = UIButton()
        callBarButton.setImage(UIImage(named: "call")?.withRenderingMode(.alwaysTemplate), for: .normal)
        callBarButton.tintColor = YELLOW_COLOR
        callBarButton.frame = CGRect(x: 0, y: 0, width: 40.0, height: 40.0)
        callBarButton.imageEdgeInsets = UIEdgeInsetsMake(0.0, 20, 0, 0)
        
        let rightBarButton = UIBarButtonItem()
        rightBarButton.customView = callBarButton
        self.navigationItem.rightBarButtonItem = rightBarButton
    
        let menuBarButton = UIButton()
        menuBarButton.setImage(UIImage(named: "menu_btn")?.withRenderingMode(.alwaysTemplate), for: .normal)
        menuBarButton.tintColor = YELLOW_COLOR
        menuBarButton.frame = CGRect(x: 0, y: 0, width: 40.0, height: 40.0)
        menuBarButton.imageEdgeInsets = UIEdgeInsetsMake(0.0, -20, 0, 0);
        
        let leftBarButtonItem = UIBarButtonItem()
        leftBarButtonItem.customView = menuBarButton
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
        
        
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
            containerView.isUserInteractionEnabled = false
            self.view.addSubview(containerView)
            
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
            let underlineWidth = CGFloat(Int(label.intrinsicContentSize.width))
            let underlineView = UIView(frame: .zero)
            underlineView.backgroundColor = YELLOW_COLOR
            label.addSubview(underlineView)
            underlineView.translatesAutoresizingMaskIntoConstraints = false;
            
            // Hairline Constraints
            underlineView.heightAnchor.constraint(equalToConstant: CGFloat(2.5)).isActive = true
            underlineView.bottomAnchor.constraint(equalTo: label.bottomAnchor, constant: 3).isActive = true
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
                navigationItem.title = "\(controllerTitles[index])"
            }
            else
            {
                label.textColor = UIColor.white
                self.allHairline[index].isHidden = true
            }
        }
    }

}
