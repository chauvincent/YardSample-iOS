//
//  ActiveRentalViewController.swift
//  YardClubExercise
//
//  Created by Vincent Chau on 10/5/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

import UIKit

class ActiveRentalViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupView()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func setupView()
    {
        self.view.backgroundColor = UIColor.blue
        self.setupNavigationItems()
        self.setupBadgeForNavigation()
        self.navigationItem.title = "ACTIVE RENTALS"
    }
    
}
