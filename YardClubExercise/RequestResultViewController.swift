//
//  RequestResultViewController.swift
//  YardClubExercise
//
//  Created by Vincent Chau on 10/7/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

import UIKit

class RequestResultViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{
    
    @IBOutlet weak var resultTextField: UITextView!
    
    @IBOutlet weak var collectionView: UICollectionView!

    var imgUrls: [String] = [] {
        didSet {
            
        }
    }
    
    var results: [Result] = [] {
        didSet {
            
        }
    }

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        getResults()
        
        
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ResultCell")

    }
    
    // MARK: - Data Service
    func getResults()
    {
        let resultEndpoint = "http://yardclub.github.io/mobile-interview/api/results.json"
        APIManager.sharedInstance.GETCatalogData(url: resultEndpoint) { (success, data) in
            
            if (success)
            {
                DispatchQueue.global(qos: .background).async { [weak self] () -> Void in
                    
                    JSONParser.parseResultJSON(data: data!, completionHandler: { (sucessful, allResults, imagesUrls) in
                        
                        DispatchQueue.main.async { () -> Void in
                            
                            if (success)
                            {
                                self?.results = allResults!
                                self?.imgUrls = imagesUrls!
                            }
                        }
                    })
                }
            }
        }
    }
    
    // MARK: - <UICollectionViewDelegate>
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
     
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResultCell", for: indexPath)
        
        return cell
    }
    
}
