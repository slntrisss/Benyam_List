//
//  CategoryCell.swift
//  BenyamList
//
//  Created by Raiymbek Merekeyev on 23.11.2022.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    static let identifier = "CategoryCell"
    
    override var isSelected: Bool{
        didSet{
            checkSelected()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        categoryView.layer.cornerRadius = categoryView.layer.bounds.width / 10
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "CategoryCell", bundle: nil)
    }
    
    func configure(with category: Category){
        checkSelected()
        categoryLabel.text = category.name
    }
    
    private func checkSelected(){
        if isSelected {
            categoryView.backgroundColor = .hexStringToUIColor(hex: "#FFA400")
            categoryLabel.textColor = .black
        }else{
            categoryView.backgroundColor = .hexStringToUIColor(hex: "#C7C7CC")
            categoryLabel.textColor = .darkGray
        }
    }
}
