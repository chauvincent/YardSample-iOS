//
//  CustomView.swift
//  YardClubExercise
//
//  Created by Vincent Chau on 10/7/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

import UIKit

class CustomView: UIView
{

    override func awakeFromNib()
    {
        super.awakeFromNib()
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.lightGray.cgColor
       // self.layer.cornerRadius = 2.0
    }

}
