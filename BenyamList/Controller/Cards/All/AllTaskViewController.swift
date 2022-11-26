//
//  AllTaskViewController.swift
//  BenyamList
//
//  Created by Raiymbek Merekeyev on 17.11.2022.
//

import UIKit

class AllTaskViewController: UIViewController {
    @IBOutlet weak var calendarView: UIView!
    @IBOutlet weak var weeksView: UIView!
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var taskTableView: UITableView!
    
    var tasks = [Task]()
    var categories = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegatesAndDatasources()
        setDefaultViews()
        initTaskListData()
        categories = getCategories()
    }
    @IBAction func changeCalendarView(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            calendarView.alpha = 1
            dateView.alpha = 0
            weeksView.alpha = 0
        }else{
            calendarView.alpha = 0
            weeksView.alpha = 1
            dateView.alpha = 1;
        }
    }
    
    //MARK: - Helper funcs
    
    private func setDelegatesAndDatasources() {
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        categoryCollectionView.automaticallyAdjustsScrollIndicatorInsets = false
        categoryCollectionView.contentInsetAdjustmentBehavior  = .never
        categoryCollectionView.register(CategoryCell.nib(), forCellWithReuseIdentifier: CategoryCell.identifier)
        
        taskTableView.dataSource = self
        taskTableView.delegate = self
        taskTableView.register(TaskCell.nib(), forCellReuseIdentifier: TaskCell.identifier)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        categoryCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    private func setDefaultViews(){
        calendarView.alpha = 1
        weeksView.alpha = 0
        dateView.alpha = 0
    }
    private func getCategories() -> [Category]{
        var set = Set<Category>()
        for task in tasks {
            set.insert(task.category)
        }
        var categories = Array(set)
        categories.insert(Category(name: "Horray", color: .gold), at: 0)
        categories.insert(Category(name: "All", color: .gold), at: 0)
        return categories
    }
}

extension AllTaskViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as! CategoryCell
        cell.configure(with: categories[indexPath.row])
        if indexPath.row == 0{
            cell.isSelected = true
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width , height: view.frame.height - (view.safeAreaInsets.top + view.safeAreaInsets.bottom))
    }
    
}

extension AllTaskViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskCell.identifier, for: indexPath) as! TaskCell
        cell.configure(with: tasks[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100;
    }
}
