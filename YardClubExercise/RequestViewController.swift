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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setupView()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Setup View
    func setupView()
    {
        // Setup Yard Club Logo Button
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.yardClubLogoPressed(_:)))
        tapGesture.numberOfTapsRequired = 1
        self.yardClubLogo.addGestureRecognizer(tapGesture)
    }
    
    
    // MARK: - IBActions
    func yardClubLogoPressed(_ sender: UITapGestureRecognizer)
    {
        self.performSegue(withIdentifier: "RequestToEquipmentSegue", sender: self)
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
