//
//  WeekViewCell.swift
//  BenyamList
//
//  Created by Raiymbek Merekeyev on 18.11.2022.
//

import UIKit

class WeekViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var weekView: UIView!
    @IBOutlet weak var dayOfTheWeek: UILabel!
    @IBOutlet weak var dayOfTheMonth: UILabel!
    override var isSelected: Bool{
        didSet{
            if self.isSelected{
                self.layer.borderWidth = 1.0
                self.layer.borderColor = UIColor.systemBlue.cgColor
            }else{
                self.layer.borderWidth = 0.0
            }
        }
    }
    
    static let identifier = "WeekViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        weekView.layer.cornerRadius = 3.0
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "WeekViewCell", bundle: nil)
    }
    
    func configure(with weekDays: WeekDays, and index: Int){
        if Date.now.getDayOfTheMonth() == weekDays.weekDate[index].getDayOfTheMonth() {
            weekView.backgroundColor = .systemBlue
            dayOfTheWeek.textColor = .white
            dayOfTheMonth.textColor = .white
        }
        
        dayOfTheWeek.text = weekDays.daysOfTheWeek[index]
        dayOfTheMonth.text = weekDays.weekDate[index].getDayOfTheMonth()
    }

}
