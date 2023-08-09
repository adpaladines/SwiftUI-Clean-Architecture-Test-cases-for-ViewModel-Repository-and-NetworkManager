//
//  BaseViewController.swift
//  Fruityvice
//
//  Created by Andres D. Paladines on 7/11/23.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    open func goTo(storyboard: StoryboardName = .fruits(.list)) {
        let main = storyboard.name
        let vc = storyboard.vcName
        let storyboard = UIStoryboard(name: main, bundle: nil)
        let nextScreen = storyboard.instantiateViewController(withIdentifier: vc)
        self.navigationController?.pushViewController(nextScreen, animated: true)
    }
    
    
}
