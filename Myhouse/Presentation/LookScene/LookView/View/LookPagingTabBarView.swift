//
//  LookPagingTabBarView.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/22.
//

import UIKit

import SnapKit

// MARK: - Protocols

protocol PagingDelegate: AnyObject {
    func didTapPagingTabBarCell(scrollTo indexPath: IndexPath)
}

final class LookPagingTabBarView: BaseView {
    
    // MARK: - Properties
    
    weak var delegate: PagingDelegate?
    
    // MARK: - UI Components
    
    lazy var tabBarcollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        layout.estimatedItemSize = CGSize(width: 100, height: 44)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        layout.minimumLineSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        registerCell()
        setDelegate()
        setSelectedCell()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setLayout() {
        self.addSubviews(tabBarcollectionView)
        
        tabBarcollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - Extensions

extension LookPagingTabBarView {
    func registerCell() {
        LookPagingTabBarCollectionViewCell.register(target: tabBarcollectionView)
    }
    
    func setDelegate() {
        tabBarcollectionView.delegate = self
        tabBarcollectionView.dataSource = self
    }
    
    func setSelectedCell() {
        tabBarcollectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: [])
    }
}

extension LookPagingTabBarView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didTapPagingTabBarCell(scrollTo: indexPath)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}

extension LookPagingTabBarView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return I18N.Look.tabBarTitleList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = LookPagingTabBarCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
        cell.setTitle(text: I18N.Look.tabBarTitleList[indexPath.item])
        return cell
    }
}
