//
//  FruitsTableViewCell.swift
//  Fruityvice
//
//  Created by Andres D. Paladines on 7/7/23.
//

import UIKit

class FruitsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var familyLabel: UILabel!
    @IBOutlet weak var orderLabel: UILabel!
    @IBOutlet weak var genusLabel: UILabel!
    
    @IBOutlet weak var infoFamilyLabel: UILabel!
    @IBOutlet weak var infoOrderLabel: UILabel!
    @IBOutlet weak var infoGenusLabel: UILabel!
    
    @IBOutlet weak var fruitImageView: UIImageView!
    
    @IBAction func infoButtonTab(_ sender: Any) {
        callback?()
    }
    
    typealias CallBackHandle = () -> ()
    var callback: CallBackHandle?
    var cellColor: UIColor? = nil
    
    var fruit: Fruit? {
        didSet {
            guard let fruit = self.fruit else {
                return
            }
            nameLabel.text = fruit.name
            familyLabel.text = fruit.family
            orderLabel.text = fruit.order
            genusLabel.text = fruit.genus
            
        }
    }
    
    var rowColor: UIColor? {
        didSet {
            guard let color = rowColor else {
                return
            }
            topView.backgroundColor = color
            topView.applyShadow(color: .black, cornerRadius: 8, opacity: 0.5)
            let image = UIImage(named: "fruits-launcher")!
            let backgroundColor = UIColor(patternImage: image)
            backgroundImageView.backgroundColor = backgroundColor
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
