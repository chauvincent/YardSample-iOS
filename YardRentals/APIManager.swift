//
//  APIManager.swift
//  YardClubExercise
//
//  Created by Vincent Chau on 10/7/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

import UIKit

class APIManager
{
    static let sharedInstance = APIManager()
    
    /*  Retreive Data Objects From Endpoint Image   */
    func GETData(url: String, completionHandler: @escaping (_ success: Bool, _ data: Data?) -> Void)
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
    

    /*  Download Image Async */
    func downloadImage(_ imgUrl: String, completionHandler: @escaping (_ downloadedImage: UIImage) -> Void )
    {
        
        DispatchQueue.global(qos: .background).async { [weak self] () -> Void in
            
            let url : NSURL? = NSURL(string: imgUrl)
            self?.getDataFromUrl(url: url as! URL) { (data, response, error)  in
            
                DispatchQueue.main.sync() { () -> Void in
                    guard let data = data, error == nil else { return }
                    completionHandler(UIImage(data: data)!)
                }
            }
        }
    }
    
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
        
}
