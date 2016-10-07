//
//  FeaturedCollectionViewCell.swift
//  YardClubExercise
//
//  Created by Vincent Chau on 10/7/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

import UIKit

class FeaturedCollectionViewCell: UICollectionViewCell
{
    let featImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    // MARK: - init
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Setup
    
    func setupViews()
    {
        self.addSubview(featImageView)
        
        // Constraints for ImageView
        self.featImageView.leftAnchor .constraint(equalTo: self.leftAnchor).isActive = true
        self.featImageView.bottomAnchor .constraint(equalTo: self.bottomAnchor).isActive = true
        self.featImageView.rightAnchor .constraint(equalTo: self.rightAnchor).isActive = true
        self.featImageView.topAnchor .constraint(equalTo: self.topAnchor).isActive = true
    }
    
    func setImage(url: String)
    {
        APIManager.sharedInstance.downloadImage(url) { (image) in
            self.featImageView.image = image
        }
    }

}
