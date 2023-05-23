//
//  PagingCollectionViewCell.swift
//  Myhouse
//
//  Created by Kim Min Joo on 2023/05/21.
//

import UIKit

import SnapKit

class PagingCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    static var isFromNib: Bool = false

    static let identifier = "PagingCollectionViewCell"
    
    private let bestSellerDummy = BestSellerDataModel.dummy()
    
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.getLayout())
        
        view.collectionViewLayout = self.getLayout()
        view.showsVerticalScrollIndicator = false
        view.isScrollEnabled = false
        view.contentInsetAdjustmentBehavior = .never
        return view
    }()
    
    private lazy var label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        registerCell()
        setDataSource()
        
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDataSource() {
        collectionView.dataSource = self
    }
    
    func setLayout() {
        self.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setupView(title: String) {
        
        label.text = title
    }
}

extension PagingCollectionViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return bestSellerDummy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = ContentCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.configureCell(bestSellerDummy[indexPath.item])
            return cell
    }
}

extension PagingCollectionViewCell {
    func registerCell() {
        ContentCell.register(target: collectionView)
    }
    
    func getLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, env -> NSCollectionLayoutSection? in
            return self.getLayoutBestSection()
        }
    }
    
    func getLayoutBestSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1/3),
            heightDimension: .fractionalHeight(1.0)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 96, trailing: 0)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            repeatingSubitem: item,
            count: 3
        )
        
        group.interItemSpacing = .fixed(8)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .none
        section.interGroupSpacing = 4
        return section
    }
    
}
