//
//  Coordinator.swift
//  Fruityvice
//
//  Created by Consultant on 8/2/23.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {

    var childCoordinators: [Coordinator] { get }
    var navigationController: UINavigationController {get set}
    func startCoordinator()

}
