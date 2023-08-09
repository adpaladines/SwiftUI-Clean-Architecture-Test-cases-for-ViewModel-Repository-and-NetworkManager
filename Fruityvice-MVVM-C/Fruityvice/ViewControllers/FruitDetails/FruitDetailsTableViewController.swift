//
//  FruitDetailsTableViewController.swift
//  Fruityvice
//
//  Created by andres paladines on 9/7/23.
//

import UIKit

protocol DisplayViewControllerDelegate: AnyObject {
    func doSomethingWith(data: String)
}
protocol DataDelegate: AnyObject {
    func didReceiveData(_ data: [String])
}

class FruitDetailsTableViewController: UITableViewController {
    
    var selectedItem: Fruit? = nil
    var selectedColor: UIColor? = nil
    
    @IBOutlet weak var sectionOneContainerView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var familyLabel: UILabel!
    @IBOutlet weak var orderLabel: UILabel!
    @IBOutlet weak var genusLabel: UILabel!
    
    @IBOutlet weak var sectionTwoContainerView: UIView!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var fatLabel: UILabel!
    @IBOutlet weak var sugarLabel: UILabel!
    @IBOutlet weak var carbohydratesLabel: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
    
    var delegate: DisplayViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()
        setViews()
        setTableView()
        
    }
    
    func setLabels() {
        guard let item = selectedItem else  {
            return
        }
        nameLabel.text = item.name
        familyLabel.text = item.family
        orderLabel.text = item.order
        genusLabel.text = item.genus
        
        caloriesLabel.text = Double(item.nutritions.calories).toStringWith(decimal: 2)
        fatLabel.text = item.nutritions.fat.toStringWith(decimal: 2)
        sugarLabel.text = item.nutritions.sugar.toStringWith(decimal: 2)
        carbohydratesLabel.text = item.nutritions.carbohydrates.toStringWith(decimal: 2)
        proteinLabel.text = item.nutritions.protein.toStringWith(decimal: 2)
        
    }
    
    func setViews() {
        sectionOneContainerView.applyShadow(color: .black, cornerRadius: 8, opacity: 0.5)
        sectionOneContainerView.backgroundColor = selectedColor
        sectionTwoContainerView.applyShadow(color: .black, cornerRadius: 8, opacity: 0.5)
        sectionTwoContainerView.backgroundColor = selectedColor
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapScreen))
        sectionOneContainerView.isUserInteractionEnabled = true
        sectionTwoContainerView.isUserInteractionEnabled = true
        sectionOneContainerView.addGestureRecognizer(tap)
        sectionTwoContainerView.addGestureRecognizer(tap)
    }
    
    func setTableView() {
        let image = UIImage(named: "fruits-background")!
        let backgroundColor = UIColor(patternImage: image)
        tableView.backgroundColor = .clear
        tableView.backgroundView = nil
        tableView.backgroundColor = backgroundColor
        tableView.sectionHeaderTopPadding = 0
    }
    
    @objc func tapScreen() {
        delegate?.doSomethingWith(data: "STRING")
    }
    
}

// MARK: - Table view data source
extension FruitDetailsTableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
//
//        switch indexPath.section {
//        case 0:
//            break
//        case 1:
//            
//            break
//        default:
//            return UITableViewCell()
//        }
//
//        return cell
//    }
    

}
