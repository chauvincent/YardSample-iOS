//
//  EquipmentDetailViewController.swift
//  YardClubExercise
//
//  Created by Vincent Chau on 10/7/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

import UIKit

class EquipmentDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    @IBOutlet weak var subCatTableView: UITableView!
    
    var allSubCategoryItems: [SubCategory] = [] {
        
        didSet {
            self.subCatTableView.reloadData()
        }
        
    }
    
    var selectedIndex: Int = 0 {
        
        didSet {
            getSubCategories(id: selectedIndex)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        setupView()
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    func setupView()
    {
        self.setupCallForNavigation()
        self.navigationItem.title = "REQUEST EQUIPMENT"
        self.subCatTableView.delegate = self
        self.subCatTableView.dataSource = self
    }
    
    // MARK: - Data Service
    
    func getSubCategories(id: Int)
    {
        let endpointURL = "http://yardclub.github.io/mobile-interview/api/catalog/" + String(id) + ".json"
        APIManager.sharedInstance.GETCatalogData(url: endpointURL) { (success, data) in
            
            if (success)
            {
                DispatchQueue.global(qos: .background).async { [weak self] () -> Void in
                    JSONParser.parseSubCategoryJSON(data: data!, completionHandler: { (success, allSubCats) in
                        
                        DispatchQueue.main.async { () -> Void in
                            if (success)
                            {
                                self?.allSubCategoryItems = allSubCats!
                            }
                        }
                    })
                }
            }
        }
    }
    
    
    // MARK: - <UITableViewDelegate>
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        self.performSegue(withIdentifier: "DetailToResultSegue", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.allSubCategoryItems.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 0.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubCell", for: indexPath)
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell.textLabel?.text = self.allSubCategoryItems[indexPath.row].displayname
        return cell
    }

}
