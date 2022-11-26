//
//  CollectionViewCell.swift
//  BenyamList
//
//  Created by Raiymbek Merekeyev on 11.11.2022.
//

import UIKit

class NewListCell: UICollectionViewCell {
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var borderView: UIView!
    
    static let identifier = "CollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "CollectionViewCell", bundle: nil)
    }
    
    func configure(with color: CategoryColor){
        colorView.backgroundColor = .getColor(from: color)
        setupView();
    }
    
    private func setupView() {
        colorView.layer.cornerRadius = colorView.layer.bounds.width / 2
        colorView.clipsToBounds = true
        
        borderView.backgroundColor = .clear
        borderView.layer.cornerRadius = borderView.layer.bounds.width / 2
        borderView.clipsToBounds = true
        borderView.layer.borderColor = UIColor.systemGray.cgColor
        borderView.layer.borderWidth = 3.0
        borderView.isHidden = true
    }
    
    func selected(){
        borderView.isHidden = false
    }

    func deselect(){
        borderView.isHidden = true
    }
}
