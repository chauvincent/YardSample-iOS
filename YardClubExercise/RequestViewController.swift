//
//  RequestViewController.swift
//  YardClubExercise
//
//  Created by Vincent Chau on 10/5/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

import UIKit

class RequestViewController: UIViewController
{
    @IBOutlet weak var yardClubLogo: UIView!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setupView()
        self.setupNav()
    }

    // MARK: - Setup View
    
    func setupView()
    {
        // Add Action to YardClub Logo
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.yardClubLogoPressed(_:)))
        tapGesture.numberOfTapsRequired = 1
        self.yardClubLogo.addGestureRecognizer(tapGesture)
    }
    
    func setupNav()
    {
        self.setupNavigationItems()
        self.setupBadgeForNavigation()
        self.navigationItem.title = "REQUEST EQUIPMENT"
    }
    
    // MARK: - IBActions
    
    func yardClubLogoPressed(_ sender: UITapGestureRecognizer)
    {
        // Push to EquipmentVC
        let equipmentViewController: EquipmentViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EquipmentViewController") as! EquipmentViewController
        self.navigationController?.pushViewController(equipmentViewController, animated: false)
    }    
    
}
