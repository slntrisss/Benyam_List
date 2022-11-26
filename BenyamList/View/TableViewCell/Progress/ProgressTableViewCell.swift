//
//  ProgressTableViewCell.swift
//  BenyamList
//
//  Created by Raiymbek Merekeyev on 27.10.2022.
//

import UIKit

class ProgressTableViewCell: UITableViewCell {
    
    @IBOutlet weak var progressCollectionView: UICollectionView!
    
    var statictics = [Statictics]()
    
    static let identifier = "ProgressTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "ProgressTableViewCell",
                     bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        progressCollectionView.register(ProgressCell.nib(), forCellWithReuseIdentifier: ProgressCell.identifier)
        progressCollectionView.dataSource = self
        progressCollectionView.delegate = self
        progressCollectionView.collectionViewLayout = setupCollectionViewLayout()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(statictics: [Statictics]){
        self.statictics = statictics
    }
    
}

extension ProgressTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return statictics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProgressCell.identifier, for: indexPath) as! ProgressCell
        cell.configure(statictics: statictics[indexPath.row])
        return cell
    }
    
    func setupCollectionViewLayout() -> UICollectionViewCompositionalLayout{
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                          heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: size)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }
    
}
