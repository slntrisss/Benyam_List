//
//  NewListViewController.swift
//  BenyamList
//
//  Created by Raiymbek Merekeyev on 11.11.2022.
//

import UIKit

protocol NewListDelegate: AnyObject{
    func addNewList(_ taskList: TaskList)
}

class NewListViewController: UIViewController {
    @IBOutlet weak var iconView: UIView!
    @IBOutlet weak var newListName: UITextField!
    @IBOutlet weak var colorCollectionView: UICollectionView!
    @IBOutlet weak var listView: UIView!
    
    var taskList: TaskList!
    static var identifier = "NewListViewController"
    weak var delegate: NewListDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorCollectionView.delegate = self
        colorCollectionView.dataSource = self
        colorCollectionView.register(NewListCell.nib(), forCellWithReuseIdentifier: NewListCell.identifier)
        
        newListName.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        newListName.becomeFirstResponder()
        setupView()
    }

    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func saveNewList(_ sender: Any) {
        let name = newListName.text!
        taskList.category.name = name
        self.dismiss(animated: true)
        delegate.addNewList(taskList)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField){
        guard let text = textField.text else {return}
        
        if text.isEmpty{
            self.navigationItem.rightBarButtonItem?.isEnabled = false
        }else{
            self.navigationItem.rightBarButtonItem?.isEnabled = true
        }
    }
    
    
    //MARK: - Helper methods
    private func setupView(){
        iconView.layer.cornerRadius = iconView.layer.bounds.width / 2
        iconView.clipsToBounds = true
        iconView.backgroundColor = .getColor(from: .dodgerBlue)
        let category = Category(name: "", color: .dodgerBlue)
        taskList = TaskList(category: category, tasks: [])
        listView.layer.cornerRadius = 5.0
        colorCollectionView.layer.cornerRadius = 5.0
        self.navigationItem.rightBarButtonItem?.isEnabled = false
    }
}

extension NewListViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        CategoryColor.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewListCell.identifier, for: indexPath) as! NewListCell
        let color = CategoryColor.allCases[indexPath.row]
        cell.configure(with: color)
        if color == .dodgerBlue{
            cell.selected()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! NewListCell
        
        for index in CategoryColor.allCases.indices{
            let indexPath = IndexPath(item: index, section: 0)
            let newListCell = collectionView.cellForItem(at: indexPath) as? NewListCell
            newListCell?.deselect()
        }
        cell.selected()
        
        let color = CategoryColor.allCases[indexPath.row]
        taskList.category.color = color
        iconView.backgroundColor = .getColor(from: color)
    }
    
}
