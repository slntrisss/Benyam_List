//
//  TaskListViewController.swift
//  BenyamList
//
//  Created by Raiymbek Merekeyev on 10.11.2022.
//

import UIKit

class TaskListViewController: UITableViewController {
    
    var taskList = [TaskList]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTaskListData()
        tableView.register(TaskTableViewCell.nib(), forCellReuseIdentifier: TaskTableViewCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.identifier, for: indexPath) as! TaskTableViewCell
        cell.configure(with: taskList[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            taskList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == NewListViewController.identifier {
            print("Heeeeyaaaa!")
            let navController = segue.destination as! UINavigationController
            let newListVC = navController.viewControllers.first as! NewListViewController
            newListVC.delegate = self
        }
    }
    
}

extension TaskListViewController: NewListDelegate{
    func addNewList(_ list: TaskList) {
        taskList.append(list)
        let lastIndex = taskList.count-1
        let indexPath = IndexPath(item: lastIndex, section: 0)
        tableView.insertRows(at: [indexPath], with: .fade)
    }
}
