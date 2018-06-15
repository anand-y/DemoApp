//
//  TvShow.swift
//  
//
//  Created by infiny webcom pvt ltd on 15/06/18.
//

import Foundation
import SwiftyJSON

class TvShow {
    
    var showName = String()
    var showDescription = String()
    
    init(tvData: JSON) {
        self.showName = tvData["show"]["title"].stringValue
        self.showDescription = tvData["show"]["overview"].stringValue
    }
}
