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
        setupNavigationBar()
        setupControllers()
        setupMenuLabels()
        setSelectedMenu(index: 0) 
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
    }
    
    func setupNavigationBar()
    {
        // Setup Navigation BarButtonItems
        let insetRightConst: CGFloat = 20.0
        let buttonSize: CGFloat = 30.0
        
        // Call Bar Button Item
        let callBarButton = UIButton()
        callBarButton.setImage(UIImage(named: "call")?.withRenderingMode(.alwaysTemplate), for: .normal)
        callBarButton.tintColor = YELLOW_COLOR
        callBarButton.frame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        callBarButton.imageEdgeInsets = UIEdgeInsetsMake(0.0, insetRightConst, 0, 0)
        
        let rightBarButton = UIBarButtonItem()
        rightBarButton.customView = callBarButton
        self.navigationItem.rightBarButtonItem = rightBarButton
        
        // Setup Menu Bar Item
        let insetLeftConst: CGFloat = -20.0
        let menuBarButton = UIButton()
        menuBarButton.setImage(UIImage(named: "menu_btn")?.withRenderingMode(.alwaysTemplate), for: .normal)
        menuBarButton.tintColor = YELLOW_COLOR
        menuBarButton.frame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        menuBarButton.imageEdgeInsets = UIEdgeInsetsMake(0.0, insetLeftConst, 0, 0);
        
        let leftBarButtonItem = UIBarButtonItem()
        leftBarButtonItem.customView = menuBarButton
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
        
        // Add Temporary Badge Next to Menu Bar Item
        let tempBadge = UILabel()
        tempBadge.clipsToBounds = true
        tempBadge.layer.cornerRadius = 6.0
        tempBadge.backgroundColor = YELLOW_COLOR
        tempBadge.textColor = UIColor.black
        tempBadge.text = " 15 ";
        tempBadge.font = UIFont(name: "OpenSans-Bold", size: 11.0)!
        tempBadge.sizeToFit()
        tempBadge.translatesAutoresizingMaskIntoConstraints = false
        leftBarButtonItem.customView?.addSubview(tempBadge);
        
        // Badge Constraints
        let leftCustomView = self.navigationItem.leftBarButtonItem?.customView
        tempBadge.leftAnchor .constraint(equalTo: leftCustomView!.rightAnchor, constant: insetLeftConst + 10.0).isActive = true
        tempBadge.centerYAnchor .constraint(equalTo: leftCustomView!.centerYAnchor).isActive = true
    }
    
    func setupControllers()
    {
        // Register RequestVC from Storyboard
        let requestViewController: RequestViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RequestViewController") as! RequestViewController
        
        // Programatic VC's for now
        let activeRentalViewController = ActiveRentalViewController()
        let openRequestRentalViewController = OpenRequestViewController()
        let myYardViewController = MyYardViewController()
    
        self.viewControllers = [requestViewController, activeRentalViewController, openRequestRentalViewController, myYardViewController]
    
        navigationItem.title = "\(controllerTitles.first!)"
    }
    
    func setupMenuLabels()
    {
        let windowBounds = UIScreen.main.bounds
        let labelSize = self.tabBar.frame.size.height
        let originY = windowBounds.size.height - labelSize
        let labelWidth = windowBounds.size.width / CGFloat(tabBarTitles.count)
        
        for (index, element) in self.tabBarTitles.enumerated()
        {
            // Set Up TabBarItem ContainerView
            let originX = CGFloat(index) * labelWidth
            let containerView = UIView(frame: CGRect(x: originX, y: originY, width: labelWidth, height: labelSize))
            containerView.backgroundColor = UIColor.clear
            containerView.isUserInteractionEnabled = false
            self.view.addSubview(containerView)
            
            // Set Up TitleLabel For Tab Bar Item
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
            
            // Add Hairline Under TitleLabel
            let underlineWidth = CGFloat(Int(label.intrinsicContentSize.width))
            let underlineView = UIView(frame: .zero)
            underlineView.backgroundColor = YELLOW_COLOR
            label.addSubview(underlineView)
            underlineView.translatesAutoresizingMaskIntoConstraints = false;
            
            // Hairline Constraints Under TitleLabel
            underlineView.heightAnchor.constraint(equalToConstant: CGFloat(2.5)).isActive = true
            underlineView.bottomAnchor.constraint(equalTo: label.bottomAnchor, constant: 3).isActive = true
            underlineView.widthAnchor.constraint(equalToConstant:underlineWidth).isActive = true
            underlineView.centerXAnchor.constraint(equalTo: label.centerXAnchor).isActive = true
            
            self.allHairline.append(underlineView)
            self.allLabels.append(label)
        }
    }
    
// MARK: - <UITabBarControllerDelegate>
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController)
    {
        setSelectedMenu(index: self.selectedIndex)
    }

// MARK: - Menu Helpers
    
    func setSelectedMenu(index: Int)
    {
        for (index, label) in self.allLabels.enumerated()
        {
            // Highlight Menu Item
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
