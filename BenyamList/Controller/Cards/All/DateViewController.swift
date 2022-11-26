//
//  DateViewController.swift
//  BenyamList
//
//  Created by Raiymbek Merekeyev on 25.11.2022.
//

import UIKit

class DateViewController: UIViewController {
    

    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.text = formatDate(date: Date.now)
        NotificationCenter.default.addObserver(self, selector: #selector(didChangeDate(_:)), name: Notification.Name("dateChanged"), object: nil)
    }
    
    @objc func didChangeDate(_ notification: NSNotification){
        if let date = notification.userInfo?["date"] as? Date{
            dateLabel.text = formatDate(date: date)
        }
    }
    private func formatDate(date: Date) -> String{
        let formatter = DateFormatter()
        let weekDayFormatter = DateFormatter()
        weekDayFormatter.dateFormat = "EEEE"
        formatter.dateFormat = "dd MMMM yyyy"
        return "\(formatter.string(from: date))\n\(weekDayFormatter.string(from: date))"
    }
}
