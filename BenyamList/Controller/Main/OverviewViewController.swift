//
//  OverviewViewController.swift
//  BenyamList
//
//  Created by Raiymbek Merekeyev on 10.11.2022.
//

import UIKit

class OverviewViewController: UITableViewController {

    var statistics = [Statictics]()
    var cards = [Card]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        tableView.register(CardTableViewCell.nib(), forCellReuseIdentifier: CardTableViewCell.identifier)
        tableView.register(ProgressTableViewCell.nib(), forCellReuseIdentifier: ProgressTableViewCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 100
        }
        else if indexPath.section == 1{
            return 300
        }
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ProgressTableViewCell.identifier, for: indexPath) as! ProgressTableViewCell
            cell.configure(statictics: statistics)
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: CardTableViewCell.identifier, for: indexPath) as! CardTableViewCell
        cell.configure(cards: cards)
        return cell
    }

}
