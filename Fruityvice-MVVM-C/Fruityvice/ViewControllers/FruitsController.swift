//
//  ViewController.swift
//  Fruityvice
//
//  Created by Andres D. Paladines on 7/7/23.
//

/*
 MVVM-C Coordinator Pattern:
(Model, View, ViewModel, Coordinator)

 Coordinator -> For navigation control on whole project.

 */

import UIKit

class FruitsViewController: BaseViewController, DisplayViewControllerDelegate {

//    var fruitsList: [Fruit] = []
//    var colorsList: [UIColor] = []
//    let networkManager = NetworkManager()
    weak var mainCoordinator: MainCoordinator?
    var viewModel: FruitListViewModel?
    
    @IBOutlet weak var fruitsTableView: UITableView!
    @IBOutlet weak var fruitsBackground: UIView!

    let dataProvider = FruitDetailsTableViewController()
    
    func doSomethingWith(data: String) {
        print(data)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Fruits List"
        setCells()
        setTableView()
        setBackground()
        fetchFruits()
        setDataProviderFromOtherController()
    }
    
    func setDataProviderFromOtherController() {
        dataProvider.delegate = self
    }
    
    func fetchFruits() {
        let getAll = Api.shared.getAll
        let web = Api.shared.base
        let urlString = web+getAll
        
        viewModel = viewModel ?? FruitListViewModel(networkManager: NetworkManager())
        viewModel?.delegate = self
        viewModel?.fetchDataWithProtocol(urlString: urlString)
    }
    
    func setCells() {
        let cellXib = UINib(nibName: "FruitsTableViewCell", bundle: nil)
        fruitsTableView.register(cellXib, forCellReuseIdentifier: "FruitsTableViewCell")
        fruitsTableView.separatorStyle = .none
    }
    
    func setTableView() {
        fruitsTableView.dataSource = self
        fruitsTableView.delegate = self
    }
    
    func setBackground() {
        let image = UIImage(named: "fruits-background")!
        let backgroundColor = UIColor(patternImage: image)
        fruitsTableView.backgroundView = nil
        fruitsBackground.backgroundColor = backgroundColor
    }
    
    func setFruitCell(in tableView: UITableView, for indexPath: IndexPath, with fruits: [Fruit], and colors: [UIColor]) -> FruitsTableViewCell? {

        let rowData = fruits[indexPath.row]
        let rowColor = colors[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "FruitsTableViewCell", for: indexPath) as? FruitsTableViewCell
        
        cell?.fruit = rowData
        cell?.rowColor = rowColor
        cell?.callback = {
            tableView.deselectRow(at: indexPath, animated: true)
            
            let storyboard = StoryboardName.fruitDetails(.info)
            let storyboard_ = UIStoryboard(name: storyboard.name, bundle: nil)
            guard
                let viewController = storyboard_.instantiateViewController(withIdentifier: storyboard.vcName) as? FruitDetailsTableViewController else {
                return
            }
            viewController.selectedItem = rowData
            viewController.selectedColor = rowColor
            viewController.delegate = self
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        
        return cell
    }

}

//MARK: TableView Protocols
extension FruitsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel, let fruits = viewModel.fruitsList else {
            return 1
        }
        return fruits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let viewModel = viewModel,
            let fruits = viewModel.fruitsList,
            let colors = viewModel.colorsList
        else {
            let cell = UITableViewCell()
            cell.textLabel?.text = "No data obtained."
            return cell
        }
        return setFruitCell(in: tableView, for: indexPath, with: fruits, and: colors) ?? UITableViewCell()
    }
    
}

extension FruitsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let storyboard = StoryboardName.fruitDetails(.tabController)
        let storyboard_ = UIStoryboard(name: storyboard.name, bundle: nil)
        guard
//            let viewController = storyboard_.instantiateViewController(withIdentifier: storyboard.vcName) as? FruitDetailsTabController,
            let viewModel = viewModel,
            let fruits = viewModel.fruitsList,
            let colors = viewModel.colorsList
        else {
            return
        }
        mainCoordinator?.navigateToDetailsScreen(selectedItem: fruits[indexPath.row], selectedColor: colors[indexPath.row], fruitDelegate: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension FruitsViewController: SrcreenRefreshProtocol {
    
    func refreshUI() {
        DispatchQueue.main.async {
            self.fruitsTableView.reloadData()
        }
    }
    
}

extension FruitsViewController {

}
