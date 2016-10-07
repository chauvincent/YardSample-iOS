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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
