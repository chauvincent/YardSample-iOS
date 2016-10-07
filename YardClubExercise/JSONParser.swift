//
//  JSONParser.swift
//  YardClubExercise
//
//  Created by Vincent Chau on 10/7/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

import Foundation

class JSONParser
{
    /*   Parse JSON from Categories Data   */
    class func parseCategoryJSON(data: Data, completionHandler: @escaping (_ success: Bool,_ categoryTuples: [(id: Int, name: String)]? ) -> Void)
    {
        
        do {
            var allTuples: [(Int, String)] = []
            let jsonData = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: AnyObject]]
            for categoryDict in jsonData!
            {
                guard let itemId = categoryDict["id"] as? Int
                    else { return  }
                
                guard let itemName = categoryDict["name"] as? String
                    else { return }
                
                allTuples.append((itemId, itemName))
            }
            
           completionHandler(true, allTuples)
            
        } catch {
            print(error.localizedDescription)
        }
        
      completionHandler(false, nil)
    }
    
     /*   Parse JSON from SubCategories Data   */
    class func parseSubCategoryJSON(data: Data, completionHandler: @escaping (_ success: Bool,_ allSubCategories: [SubCategory]? ) -> Void)
    {
        
        do {
            var allSubCat: [SubCategory] = []
            
            let jsonData = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: AnyObject]]
            for categoryDict in jsonData!
            {

                guard let itemId = categoryDict["id"] as? Int
                    else { return  }
                
                guard let itemDetail = categoryDict["detail"] as? String
                    else { return  }
                
                guard let itemName = categoryDict["display_name"] as? String
                    else { return }
                
                let newSubCat = SubCategory(id: itemId, display: itemName, detail: itemDetail)
                allSubCat.append(newSubCat)
            }
            
            completionHandler(true, allSubCat)
            
        } catch {
            print(error.localizedDescription)
        }
        
        completionHandler(false, nil)
    }
    
     /*   Parse JSON from Results Data   */
    class func parseResultJSON(data: Data, completionHandler: @escaping (_ success: Bool,_ allResults: [Result]?,_ allPhotos: [String]? ) -> Void)
    {
        do {
            var allResults: [Result] = []
            var imageUrls: [String] = []
            let jsonData = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject]
            
            guard let resultsJSON = jsonData!["results"] as? [[String: AnyObject]]
                else { return }
            
            for resultDict in resultsJSON
            {
                let result = Result(id: resultDict["id"] as! Int,
                                    name: resultDict["name"] as! String,
                                    descript: resultDict["description"] as! String,
                                    daily: resultDict["daily_rate"] as! String,
                                    weekly: resultDict["weekly_rate"] as! String,
                                    monthly: resultDict["monthly_rate"] as! String,
                                    operated: resultDict["operated_rates"] as! String)
                allResults.append(result)
            }
            
            guard let imageJSON = jsonData!["featured_photos"] as? [[String: AnyObject]]
                else { return }
            
            for photoDict in imageJSON
            {
                let urlString = photoDict["url"]
                imageUrls.append(urlString as! String)
            }
            
            completionHandler(true, allResults, imageUrls)
            
        } catch {

            print(error.localizedDescription)
            completionHandler(false, nil, nil)
        }
    }

}
