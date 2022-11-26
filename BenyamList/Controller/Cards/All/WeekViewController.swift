//
//  WeekViewController.swift
//  BenyamList
//
//  Created by Raiymbek Merekeyev on 17.11.2022.
//

import UIKit

class WeekViewController: UIViewController {
    
    @IBOutlet weak var weekDaysCollectionView: UICollectionView!
    
    var weekDays: WeekDays!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView(){
        weekDaysCollectionView.delegate = self
        weekDaysCollectionView.dataSource = self
        weekDaysCollectionView.register(WeekViewCell.nib(), forCellWithReuseIdentifier: WeekViewCell.identifier)
        weekDays = WeekDays.getData()
    }

}

extension WeekViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weekDays.weekDate.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeekViewCell.identifier, for: indexPath)
        as! WeekViewCell
        cell.configure(with: weekDays, and: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeekViewCell.identifier, for: indexPath) as! WeekViewCell
        let dateDict = ["date": weekDays.weekDate[indexPath.row]]
        NotificationCenter.default.post(name: Notification.Name("dateChanged"), object: nil, userInfo: dateDict)
        cell.isSelected = true
    }
    
}

