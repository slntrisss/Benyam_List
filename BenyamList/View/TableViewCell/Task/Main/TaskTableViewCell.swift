//
//  TaskTableViewCell.swift
//  BenyamList
//
//  Created by Raiymbek Merekeyev on 10.11.2022.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var iconView: UIView!
    @IBOutlet weak var taskCount: UILabel!
    
    static let identifier = "TaskTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "TaskTableViewCell", bundle: nil)
    }
    
    func configure(with taskList: TaskList){
        taskLabel.text = taskList.category.name
        iconView.layer.cornerRadius = iconView.layer.bounds.width / 2
        taskCount.text = String(taskList.tasksNeedToBeCompleted)
        iconView.clipsToBounds = true
        iconView.backgroundColor = .getColor(from: taskList.category.color)
    }
    
}
