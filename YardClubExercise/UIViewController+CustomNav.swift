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
    
    
    
}
