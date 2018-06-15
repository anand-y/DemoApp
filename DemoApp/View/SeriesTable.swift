//
//  SeriesTable.swift
//  DemoApp
//
//  Created by infiny webcom pvt ltd on 15/06/18.
//  Copyright © 2018 infiny webcom pvt ltd. All rights reserved.
//
//

import UIKit
class SeriesTable: UITableView, UITableViewDelegate, UITableViewDataSource {
   
    var paginationDelegate: PaginationDelegate?
    
    var seriesDataSource = [TvShow](){
        didSet{
            reloadData()
        }
    }
    
    override init(frame: CGRect, style:UITableViewStyle){
        super.init(frame: frame, style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.delegate = self
        self.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seriesDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : SeriesCell = tableView.dequeueReusableCell(withIdentifier: "seriesCell", for: indexPath) as! SeriesCell
        
        let showData = seriesDataSource[indexPath.row]
        cell.nameLabel.text = showData.showName
        cell.descriptionLabel.text = showData.showDescription
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //Checking condition for pagination
        if indexPath.row == self.seriesDataSource.count - 1 {
            //Calling delegate method
            paginationDelegate?.fetchMoreData()
        }
    }
}
