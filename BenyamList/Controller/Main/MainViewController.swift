//
//  MainViewController.swift
//  BenyamList
//
//  Created by Raiymbek Merekeyev on 27.10.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var overviewContentView: UIView!
    @IBOutlet weak var taskListContentView: UIView!
    
    weak var taskListVC: TaskListViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "task"{
            taskListVC = segue.destination as? TaskListViewController
        }
        if segue.identifier == NewListViewController.identifier{
            let navController = segue.destination as! UINavigationController
            let newListVC = navController.viewControllers.first as! NewListViewController
            newListVC.delegate = taskListVC
        }
    }
    
    
}
