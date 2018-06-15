//
//  DeveloperView.swift
//  DeveloperSearch
//
//  Created by Abrar Ul Haq on 16/06/2018.
//  Copyright © 2018 AbrarUlHaq. All rights reserved.
//

import UIKit

class DeveloperView: UIView {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var skill: UILabel!
    @IBOutlet weak var sex: UILabel!
    
    class func createNew(withAutoresizingMaskEnabled flag: Bool) -> DeveloperView {
        let view: DeveloperView? = (Bundle.main.loadNibNamed("DeveloperView", owner: self, options: nil)?.first as? DeveloperView)
        view?.translatesAutoresizingMaskIntoConstraints = flag
        //view?.containerView.layer.zPosition = 1.0
        return view!
    }
    
    func updateView(withDeveloperDetail developer: Developer){
        self.name.text = "Name: \(developer.name ?? "")"
        self.skill.text = "Skill: \(developer.skill ?? "")"
        self.sex.text = "Sex: \(developer.gender ?? "")"
    }
    
    func noDeveloper(){
        self.name.text = "Please Refresh... to get more"
    }
    

}
