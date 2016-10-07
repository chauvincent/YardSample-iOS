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
        self.setupNavigationBar()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Setup View
    func setupView()
    {
        // Add Action to YardClub Logo
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.yardClubLogoPressed(_:)))
        tapGesture.numberOfTapsRequired = 1
        self.yardClubLogo.addGestureRecognizer(tapGesture)
        self.navigationItem.title = "REQUEST EQUIPMENT"
    }
    
    func setupNavigationBar()
    {
        self.setupNavigationItems()
        self.setupBadgeForNavigation()
    }
    
    // MARK: - IBActions
    func yardClubLogoPressed(_ sender: UITapGestureRecognizer)
    {
        // Push to EquipmentVC
        let equipmentViewController: EquipmentViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EquipmentViewController") as! EquipmentViewController
        self.navigationController?.pushViewController(equipmentViewController, animated: false)
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
