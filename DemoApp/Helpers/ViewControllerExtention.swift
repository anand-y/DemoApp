//
//  ViewControllerExtention.swift
//  DemoApp
//
//  Created by infiny webcom pvt ltd on 15/06/18.
//  Copyright © 2018 infiny webcom pvt ltd. All rights reserved.
//
//  Class to implement view controller extention for helper functions

import Foundation
import UIKit

extension UIViewController{
    
    //Mark :- UIAlertView boiler plate code
    // Passing array of actionTitle and array of closure for action

    func popupAlert(title: String?, message: String?, actionTitles:[String?], actions:[((UIAlertAction) -> Void)?]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, title) in actionTitles.enumerated() {
            let action = UIAlertAction(title: title, style: .default, handler: actions[index])
            alert.addAction(action)
        }
        self.present(alert, animated: true, completion: nil)
    }
}
