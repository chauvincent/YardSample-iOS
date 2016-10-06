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

    @IBOutlet weak var menuTabBar: UITabBar!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setupView()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    func setupView()
    {
        self.view.backgroundColor = UIColor.red
        self.navigationItem.title = "YourTitle"
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
