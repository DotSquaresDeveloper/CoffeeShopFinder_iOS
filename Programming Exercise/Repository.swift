//
//  Repository.swift
//  JSON TableView
//
//  Created by John Clem on 3/4/15.
//  Copyright (c) 2015 Learn Swift. All rights reserved.
//

import UIKit

class Repository {
    
    var name: String?
    var innerdata : NSDictionary?
    var address: String?
    var distance: Int
    
    init(json: NSDictionary) {
        
        self.innerdata = json;
        self.name = json["name"] as? String
        var location: NSDictionary ;
        location = (json["location"]as?NSDictionary)!
       
       if let val: AnyObject = location["address"] {
               self.address = (location["address"]as?String)!
        }
        else
       {
        self.address = "N/A"
        }
        
        if let val: AnyObject = location["distance"] {
           self.distance = (location["distance"]as?Int)!
        }
        else
        {
            self.distance = 0
        }
        
}
}