//
//  DeveloperModel.swift
//  DeveloperSearch
//
//  Created by Abrar Ul Haq on 15/06/2018.
//  Copyright © 2018 AbrarUlHaq. All rights reserved.
//

import UIKit

let sharedInstance = DeveloperModel()
let fileName : NSString = "dev.json"

class DeveloperModel: NSObject {

    class func getInstance() -> DeveloperModel
    {
        Util.copyFile(fileName: fileName)
        return sharedInstance
    }
    
    func getDeveloperList() -> [Developer] {
        
        var developerList : [Developer] = []
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: Util.getPath(fileName: fileName as String)), options: .mappedIfSafe)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            if let jsonResult = jsonResult as? [NSDictionary]{
                for dev in jsonResult {
                    let devObj = Developer.init(withDeveloperDictionary: dev)
                    developerList.append(devObj)
                }
                
            }
        } catch {
            // handle error
        }
        
        
        return developerList
        
    }
    
}
