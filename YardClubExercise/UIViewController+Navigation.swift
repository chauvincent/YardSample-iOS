//
//  UIViewController+CustomNav.swift
//  YardClubExercise
//
//  Created by Vincent Chau on 10/7/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

import UIKit

extension UIViewController
{
    func setupNavigationItems()
    {
        // Setup Call Icon
        setupCallForNavigation()
        
        // Setup Menu Icon
        setupMenuForNavigation()
        
    }
    
    func setupBadgeForNavigation()
    {
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
        self.navigationItem.leftBarButtonItem?.customView?.addSubview(tempBadge);
        
        // Badge Constraints
        let insetLeftConst: CGFloat = -20.0
        let leftCustomView = self.navigationItem.leftBarButtonItem?.customView
        tempBadge.leftAnchor .constraint(equalTo: leftCustomView!.rightAnchor, constant: insetLeftConst + 10.0).isActive = true
        tempBadge.centerYAnchor .constraint(equalTo: leftCustomView!.centerYAnchor).isActive = true
    }
    
    func setupCallForNavigation()
    {
        let insetRightConst: CGFloat = 20.0
        let buttonSize: CGFloat = 30.0
        
        // Call Bar Button Item
        let callBarButton = UIButton()
        callBarButton.setImage(UIImage(named: "call")?.withRenderingMode(.alwaysTemplate), for: .normal)
        callBarButton.tintColor = YELLOW_COLOR
        callBarButton.frame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        callBarButton.imageEdgeInsets = UIEdgeInsetsMake(0.0, insetRightConst, 0, 0)
        
        // Add Tap Gesture, override in VC if needed
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.callBarButtonPressed(_:)))
        tapGesture.numberOfTapsRequired = 1
        callBarButton.addGestureRecognizer(tapGesture)
        
        
        let rightBarButton = UIBarButtonItem()
        rightBarButton.customView = callBarButton
        self.navigationItem.rightBarButtonItem = rightBarButton
        
    }
    
    func setupMenuForNavigation()
    {
        // Setup Menu Bar Item
        let buttonSize: CGFloat = 30.0
        let insetLeftConst: CGFloat = -20.0
        let menuBarButton = UIButton()
        menuBarButton.setImage(UIImage(named: "menu_btn")?.withRenderingMode(.alwaysTemplate), for: .normal)
        menuBarButton.tintColor = YELLOW_COLOR
        menuBarButton.frame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        menuBarButton.imageEdgeInsets = UIEdgeInsetsMake(0.0, insetLeftConst, 0, 0);
        
        // Add Tap Gesture 
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.menuBarButtonPressed(_:)))
        tapGesture.numberOfTapsRequired = 1
        menuBarButton.addGestureRecognizer(tapGesture)
        
        let leftBarButtonItem = UIBarButtonItem()
        leftBarButtonItem.customView = menuBarButton
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    
    // MARK: - Bar Button Selectors
    
    func callBarButtonPressed(_ sender: UITapGestureRecognizer)
    {
        print("called in extension, override in vc if needed or modify here")
    }
    
    func menuBarButtonPressed(_ sender: UITapGestureRecognizer)
    {
        print("called in extension, override in vc if needed or modify here")
    }
    
    
}
