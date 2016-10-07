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
                print(categoryDict)
                
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
    
    
    
}
