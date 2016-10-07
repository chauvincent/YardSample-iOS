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
    
    func GETCatalogData(url: String, completionHandler: @escaping (_ success: Bool, _ data: Data?) -> Void)
    {
        guard let endpointURL = NSURL(string: url) else {  return  }
        
        var request = URLRequest(url: endpointURL as URL)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
           
            if (error != nil)
            {
                print(error?.localizedDescription)
                completionHandler(false, nil)
            }
            
            if let httpResponse = response as? HTTPURLResponse
            {
                let statusCode = httpResponse.statusCode
                let valid = ((statusCode >= 200) && (statusCode < 300)) ? true : false
                
                if (valid)
                {
                    DispatchQueue.main.async(execute: {
                        completionHandler(true, data!)
                    })
                }
                else
                {
                    DispatchQueue.main.async(execute: {
                        completionHandler(false, nil)
                    })
                }
            }
        }
        
        task.resume()

    }
    
    
    
    
}
