//
//  EquipmentViewController.swift
//  YardClubExercise
//
//  Created by Vincent Chau on 10/7/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

import UIKit

class EquipmentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    @IBOutlet weak var equipmentTableView: UITableView!
    
    var selectedIndex: Int = 0
    
    var categorys: [(Int, String)] = [] {
        didSet {
            self.equipmentTableView.reloadData()
        }
    }

    // MARK: - View Lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    
        getCategories()
        setupView()
        setupNav()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
     // MARK: - Navigation
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "CategoryToSubSegue"
        {
            if let destViewController = segue.destination as? EquipmentDetailViewController
            {
                destViewController.selectedIndex = self.selectedIndex
            }
        }
    }
    
    // MARK: - View Setup
    
    func setupView()
    {
        self.equipmentTableView.delegate = self
        self.equipmentTableView.dataSource = self
    }

    func setupNav()
    {
        self.setupCallForNavigation()
        self.navigationItem.title = "REQUEST EQUIPMENT"
    }

    // MARK: - Data Services
    func getCategories()
    {
        let endpointURL = "http://yardclub.github.io/mobile-interview/api/catalog.json"
        
        APIManager.sharedInstance.GETCatalogData(url: endpointURL) { (success, data) in
            
            if (success)
            {
                DispatchQueue.global(qos: .background).async { [weak self] () -> Void in
                        JSONParser.parseJSON(data: data!, completionHandler: { (success, allTuples) in
                            DispatchQueue.main.async { () -> Void in
                                
                                if (success)
                                {
                                    self?.categorys = allTuples!
                                    self?.equipmentTableView.reloadData()
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
        
        let selectedId = self.categorys[indexPath.row].0 // Retreive id from tuple
        self.selectedIndex = selectedId
        
        self.performSegue(withIdentifier: "CategoryToSubSegue", sender: nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.categorys.count
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell.textLabel?.text = self.categorys[indexPath.row].1 // Retreive category name from tuple
        
        return cell
    }
    
}
