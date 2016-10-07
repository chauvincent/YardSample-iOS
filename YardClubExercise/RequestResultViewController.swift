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
            print("did set image url")
            self.collectionView.reloadData()
        }
    }
    
    var results: [Result] = [] {
        didSet {
            setupResultTextField()
        }
    }

    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        setupView()
        
        getResults()
        

    }
    
    func setupView()
    {
        self.collectionView!.register(FeaturedCollectionViewCell.self, forCellWithReuseIdentifier: "FeatCell")
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    // MARK: - Data Service
    func getResults()
    {
        let resultEndpoint = "http://yardclub.github.io/mobile-interview/api/results.json"
        APIManager.sharedInstance.GETData(url: resultEndpoint) { (success, data) in
            
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
    
    func setupResultTextField()
    {
        for item in results
        {
            var resultText: String?
            resultText = self.resultTextField.text
        
            let itemCostString = "Name: \(item.name)\nDaily Rate: \(item.dailyRate) \nWeekly Rate: \(item.weeklyRate) \nOperated Rate:\(item.operatedRate)\n\n"
            
            resultText?.append(itemCostString)
            self.resultTextField.text = resultText
        }
    }
    
    
    // MARK: - <UICollectionViewDelegate>
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.imgUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeatCell", for: indexPath) as! FeaturedCollectionViewCell
        cell.setImage(url: self.imgUrls[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
    
        var size = self.collectionView.frame.size
        size.width = (size.width / 2.0)
        size.height = (size.height / 2.0)
        
        return size
    }
}
