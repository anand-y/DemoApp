//
//  APIManager.swift
//  DemoApp
//
//  Created by infiny webcom pvt ltd on 15/06/18.
//  Copyright © 2018 infiny webcom pvt ltd. All rights reserved.
//
//
// Single file for all network call


import Foundation
import Alamofire
import SwiftyJSON

class APIManager{
    
    //Creating singleton instance of APIManager
    static let sharedApiManager = APIManager()
    
    private init() {
        
    }
    
    //Func for get request
    func fetchDataGetRequest(requestUrl: String, requestHeader: [String:String], resultHandler: @escaping (_ data: JSON?) -> ()) -> () {
       
       
        Alamofire.request(requestUrl, method :.get, headers:requestHeader).responseJSON(completionHandler: { response in
            
            switch response.result
            {
                
            case .success(let result):
                 let jsonResponse = JSON(result)
                 resultHandler(jsonResponse)
                break
            case .failure(let error):
                print("Error fetching data: \(error)")
                resultHandler(JSON.null)
                break
            }
        })
    }
}
