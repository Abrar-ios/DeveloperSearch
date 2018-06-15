//
//  ViewController.swift
//  DeveloperSearch
//
//  Created by Abrar Ul Haq on 15/06/2018.
//  Copyright © 2018 AbrarUlHaq. All rights reserved.
//

import UIKit
import Koloda

private var numberOfCards: Int = 5

class ViewController: UIViewController {

     var developerList : [Developer] = [Developer]()
    @IBOutlet weak var kolodaView: KolodaView!
    
    fileprivate var dataSource: [UIImage] = {
        var array: [UIImage] = []
        for index in 0..<numberOfCards {
            array.append(UIImage(named: "Card_like_\(index + 1)")!)
        }
        
        return array
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.developerList = DeveloperModel.getInstance().getDeveloperList()
        
        kolodaView.dataSource = self
        kolodaView.delegate = self
       
    }
    
    // MARK: IBActions
    
    @IBAction func leftButtonTapped() {
        kolodaView?.swipe(.left)
    }
    
    @IBAction func rightButtonTapped() {
        kolodaView?.swipe(.right)
    }
    
    @IBAction func undoButtonTapped() {
        kolodaView?.revertAction()
    }
    


}

// MARK: KolodaViewDelegate

extension ViewController: KolodaViewDelegate {
    
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        
        kolodaView.resetCurrentCardIndex()
        
    }
    
}

// MARK: KolodaViewDataSource

extension ViewController: KolodaViewDataSource {
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return self.developerList.count
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .default
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
       let developerView : DeveloperView = DeveloperView.createNew(withAutoresizingMaskEnabled: false)
        
        if index < self.developerList.count {
             developerView.updateView(withDeveloperDetail: self.developerList[index])
        }else {
            developerView.noDeveloper()
        }
       
        return developerView
       
    }
    
    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        return Bundle.main.loadNibNamed("OverlayView", owner: self, options: nil)?[0] as? OverlayView
    }
}

