//
//  MainCoordinator.swift
//  Fruityvice
//
//  Created by Consultant on 8/2/23.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []

    var navigationController: UINavigationController = UINavigationController()

    
    func startCoordinator() {
        let storyboard = StoryboardName.fruits(.list)
        let storyboard_ = UIStoryboard(name: storyboard.name, bundle: nil)
        let viewController = storyboard_.instantiateViewController(withIdentifier: storyboard.vcName) as! FruitsViewController
        viewController.mainCoordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }

    func navigateToDetailsScreen(
        selectedItem: Fruit?,
        selectedColor: UIColor?,
        fruitDelegate: DisplayViewControllerDelegate?
    ) {
        let storyboard = StoryboardName.fruitDetails(.tabController)
        let storyboard_ = UIStoryboard(name: storyboard.name, bundle: nil)
        let viewController = storyboard_.instantiateViewController(withIdentifier: storyboard.vcName)  as! FruitDetailsTabController
        viewController.selectedItem = selectedItem
        viewController.selectedColor = selectedColor
        viewController.fruitDelegate = fruitDelegate

        navigationController.pushViewController(viewController, animated: true)
    }

}
