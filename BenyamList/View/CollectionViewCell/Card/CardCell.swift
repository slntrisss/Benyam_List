//
//  CardCell.swift
//  BenyamList
//
//  Created by Raiymbek Merekeyev on 02.11.2022.
//

import UIKit

class CardCell: UICollectionViewCell {
    
    static let identifier = "CardCell"
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var iconBackground: UIView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var numOfTasksLabel: UILabel!
    
    var card: Card?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "CardCell", bundle: nil)
    }
    
    func configure(card: Card){
        self.card = card
        icon.image = UIImage(systemName: card.icon)
        numOfTasksLabel.text = String(card.totalNumberOfTasks)
        label.text = card.type.rawValue
        configureIcon()
    }
    private func configureIcon(){
        cardView.layer.cornerRadius = CGFloat(7)
        iconBackground.layer.cornerRadius = iconBackground.layer.bounds.width / 2
        iconBackground.clipsToBounds = true
        iconBackground.backgroundColor = UIColor.hexStringToUIColor(hex: card!.iconBackgroundColor)
    }
}
