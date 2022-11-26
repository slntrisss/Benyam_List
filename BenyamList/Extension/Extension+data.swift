//
//  Extension+data.swift
//  BenyamList
//
//  Created by Raiymbek Merekeyev on 09.11.2022.
//

import Foundation

extension OverviewViewController{
    func initData(){
        initStatisticsData()
        initCardsData()
    }
    
    private func initStatisticsData(){
        statistics.append(Statictics(totalNumberOfTasks: 86, completedNumberOfTasks: 54, type: .today))
        statistics.append(Statictics(totalNumberOfTasks: 176, completedNumberOfTasks: 78, type: .overall))
    }
    private func initCardsData(){
        cards.append(Card(type: .scheduled, totalNumberOfTasks: 67, icon: "calendar.badge.clock", iconBackgroundColor: "#FD8C3D"))
        cards.append(Card(type: .today, totalNumberOfTasks: 43, icon: "list.bullet.rectangle", iconBackgroundColor: "#2C65FD"))
        cards.append(Card(type: .all, totalNumberOfTasks: 110, icon: "tray.fill", iconBackgroundColor: "#808080"))
        cards.append(Card(type: .missed, totalNumberOfTasks: 3, icon: "calendar.badge.exclamationmark", iconBackgroundColor: "#FD2424"))
    }
}

extension TaskListViewController{
    func initTaskListData(){
        //Category
        let workCategory = Category(name: "Work", color: .dodgerBlue)
        let travelCategory = Category(name: "Travel", color: .cyan)
        let workoutCategory = Category(name: "Workout", color: .mediumSlateBlue)
       
        //Tasks
        var tasks1 = [Task]()
        tasks1.append(Task(title: "Leetcode", creatationDate: Date.now, category: workCategory, priority: .low))
        tasks1.append(Task(title: "Leetcode", creatationDate: Date.now, category: workCategory, priority: .urgent))
        
        var tasks2 = [Task]()
        tasks2.append(Task(title: "Travel", creatationDate: Date.now, category: travelCategory, priority: .medium))
        
        var tasks3 = [Task]()
        tasks3.append(Task(title: "Jumping rope", creatationDate: Date.now, category: workCategory, priority: .urgent))
        
        //TaskList
        taskList.append(TaskList(category: workCategory, tasks: tasks1))
        taskList.append(TaskList(category: workoutCategory, tasks: tasks3))
        taskList.append(TaskList(category: travelCategory, tasks: tasks2))
    }
}

extension AllTaskViewController{
    func initTaskListData(){
        //Category
        let workCategory = Category(name: "Work", color: .dodgerBlue)
        let travelCategory = Category(name: "Travel", color: .cyan)
        let workoutCategory = Category(name: "Workout", color: .mediumSlateBlue)
       
        //Tasks
        var tasks1 = [Task]()
        tasks1.append(Task(title: "Leetcode", creatationDate: Date.now, status: Status.overdue, category: workCategory, priority: .urgent))
        tasks1.append(Task(title: "Leetcode", creatationDate: Date.now, status: Status.misssed, category: workCategory, priority: .low))
        
        var tasks2 = [Task]()
        tasks2.append(Task(title: "Travel", creatationDate: Date.now, category: travelCategory, priority: .medium))
        
        var tasks3 = [Task]()
        tasks3.append(Task(title: "Jumping rope", creatationDate: Date.now, status: Status.completed, category: workoutCategory, priority: .urgent))
        
        tasks = tasks1 + tasks2 + tasks3
    }
}
