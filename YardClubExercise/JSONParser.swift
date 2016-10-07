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
    
    class func parseJSON(data: Data, completionHandler: @escaping (_ success: Bool,_ categoryTuples: [(id: Int, name: String)]? ) -> Void)
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
    
    
    class func parseSubCategoryJSON(data: Data, completionHandler: @escaping (_ success: Bool,_ categoryTuples: [SubCategory]? ) -> Void)
    {
        do {
            var allSubCat: [SubCategory] = []
            
            let jsonData = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: AnyObject]]
            for categoryDict in jsonData!
            {
                print("printing dict")
                print(categoryDict)
                
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
    
}
