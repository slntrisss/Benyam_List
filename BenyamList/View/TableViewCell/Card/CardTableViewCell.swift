//
//  CardTableViewCell.swift
//  BenyamList
//
//  Created by Raiymbek Merekeyev on 02.11.2022.
//

import UIKit

class CardTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cardCollectionView: UICollectionView!
    
    static let identifier = "CardTableViewCell"
    var cards = [Card]()

    override func awakeFromNib() {
        super.awakeFromNib()
        cardCollectionView.collectionViewLayout = createLayout()
        cardCollectionView.register(CardCell.nib(), forCellWithReuseIdentifier: CardCell.identifier)
        cardCollectionView.delegate = self
        cardCollectionView.dataSource = self
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "CardTableViewCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(cards: [Card]){
        self.cards = cards
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout{
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                                                             heightDimension: .fractionalHeight(1)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        
        let fullItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)))
        
        let verticalGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                               heightDimension: .fractionalHeight(1)),
            subitem: fullItem, count: 2)
        verticalGroup.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        verticalGroup.interItemSpacing = .fixed(8)
        
        let horizontalGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .absolute(200)),
        subitems: [item, verticalGroup])
        horizontalGroup.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        
        let mainItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100)))
        mainItem.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16)
        
        let mainGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(300)), subitems: [mainItem, horizontalGroup])
        
        let section = NSCollectionLayoutSection(group: mainGroup)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
}

extension CardTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.identifier, for: indexPath) as! CardCell
        cell.configure(card: cards[indexPath.row])
        return cell
    }
    
    
    
}
