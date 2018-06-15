//
//  Developer.swift
//  DeveloperSearch
//
//  Created by Abrar Ul Haq on 15/06/2018.
//  Copyright © 2018 AbrarUlHaq. All rights reserved.
//

import UIKit

class Developer: NSObject {
    
    var name: String!
    var skill: String!
    var gender: String!
    
    override init() {
        
        name = ""
        skill = ""
        gender = ""
    }
    
    init(withDeveloperDictionary developer: NSDictionary){
        
        name = developer.value(forKey: "name") as! String
        skill = developer.value(forKey: "skill") as! String
        gender = developer.value(forKey: "sex") as! String
        
    }
}
