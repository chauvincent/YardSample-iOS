//
//  APIManager.swift
//  YardClubExercise
//
//  Created by Vincent Chau on 10/7/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

import Foundation

class APIManager
{
    static let sharedInstance = APIManager()
    
    func GETCatalogJSON(completionHandler: @escaping (_ success: Bool) -> Void)
    {
        guard let endpointURL = NSURL(string: "http://yardclub.github.io/mobile-interview/api/catalog.json") else {  return  }
        var request = URLRequest(url: endpointURL as URL)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
           
            if (error != nil)
            {
                print(error?.localizedDescription)
                completionHandler(false)
            }
            
            if let httpResponse = response as? HTTPURLResponse
            {
                let statusCode = httpResponse.statusCode
                let valid = ((statusCode >= 200) && (statusCode < 300)) ? true : false
                
                if (valid)
                {
                
                }
                else
                {
                    DispatchQueue.main.async(execute: {
                            completionHandler(false)
                    })
                }
            }
        }
        
        task.resume()

    }
    
    
    func GETSubcategory(completionHandler: @escaping (_ success: Bool) -> Void)
    {
        
    }
    
    
    
}
