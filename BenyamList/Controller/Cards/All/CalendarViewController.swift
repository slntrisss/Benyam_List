//
//  CalendarViewController.swift
//  BenyamList
//
//  Created by Raiymbek Merekeyev on 17.11.2022.
//

import UIKit
import FSCalendar
class CalendarViewController: UIViewController {

    @IBOutlet weak var calendarView: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarView.layer.cornerRadius = 7.0
    }
}
