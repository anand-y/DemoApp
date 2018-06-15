//
//  TvSeriesListVc.swift
//  DemoApp
//
//  Created by infiny webcom pvt ltd on 15/06/18.
//  Copyright © 2018 infiny webcom pvt ltd. All rights reserved.
//

import UIKit
import SwiftyJSON

//Mark:- Defing protocal for pagination
protocol PaginationDelegate {
    func fetchMoreData()
}

class TvSeriesListVc: UIViewController {

    var pageCounter = 1
    var tvSeriesData : [TvShow] = []
    
    @IBOutlet var tvSeriesTable: SeriesTable!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Tv Series"
        fetchData(pageCount: pageCounter)
        tvSeriesTable.paginationDelegate = self
    }

    
    func fetchData(pageCount: Int){
        
        let requestUrl = fetchShowListUrl + "\(pageCount)"
        let requestHeader = ["Content-Type" : "application/json", "trakt-api-key" : apiKey]
        
        APIManager.sharedApiManager.fetchDataGetRequest(requestUrl: requestUrl, requestHeader: requestHeader) { (fetchResult) in
            
                if fetchResult != JSON.null  {
                    
                    for data in (fetchResult?.arrayValue)!{
                        
                        let show = TvShow(tvData: data)
                        self.tvSeriesData.append(show)
                    }
                    self.tvSeriesTable.separatorStyle = .singleLine
                    DispatchQueue.main.async {
                        self.tvSeriesTable.seriesDataSource = self.tvSeriesData
                    }
                    
                } else{
                    self.tvSeriesTable.separatorStyle = .none
                    //Calling method defined in ViewController Extension
                    self.popupAlert(title: nil, message: "Error connecting the server, please try again", actionTitles: ["Ok"], actions: [nil])
                
                }
        }

    }
   
}

//Mark:- Pagination delegate implementaion

extension TvSeriesListVc: PaginationDelegate {
    func fetchMoreData() {
        self.pageCounter += 1
        self.fetchData(pageCount: self.pageCounter)
    }
}
