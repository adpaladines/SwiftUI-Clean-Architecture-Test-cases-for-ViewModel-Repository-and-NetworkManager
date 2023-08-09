//
//  FruitDetailsTabController.swift
//  Fruityvice
//
//  Created by andres paladines on 8/7/23.
//

import UIKit

class FruitDetailsTabController: UITabBarController {
    
    var selectedItem: Fruit? = nil
    var selectedColor: UIColor? = nil
    var fruitDelegate: DisplayViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let vcs = viewControllers else {
            return
        }
        vcs.forEach { vc_ in
            if let vc = vc_ as? FruitDetailsTableViewController {
                vc.selectedItem = selectedItem
                vc.selectedColor = selectedColor
                vc.delegate = self
            } else if let vc = vc_ as? FruitDetailsWikiViewController {
                vc.selectedItem = selectedItem
                vc.selectedColor = selectedColor
            }
        }
        
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        if let vc = self.selectedViewController as? FruitDetailsTableViewController {
            vc.selectedItem = selectedItem
            vc.selectedColor = selectedColor
        } else if let vc = self.selectedViewController as? FruitDetailsWikiViewController {
            vc.selectedItem = selectedItem
            vc.selectedColor = selectedColor
        }
        
    }
    
    
    
}

extension FruitDetailsTabController: DisplayViewControllerDelegate {
    
    func doSomethingWith(data: String) {
        fruitDelegate?.doSomethingWith(data: "FROM Tab Bar")
    }
    
    
}
