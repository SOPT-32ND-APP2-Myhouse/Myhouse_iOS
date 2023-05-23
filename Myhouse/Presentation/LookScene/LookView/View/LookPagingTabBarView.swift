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
        layout.minimumInteritemSpacing = 8
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
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUI() {
        let indexPath = IndexPath(item: 0, section: 0)
        delegate?.didTapPagingTabBarCell(scrollTo: indexPath) // 이동 이벤트를 처리하기 위해 delegate 호출
    }
    
    override func setLayout() {
        self.addSubviews(tabBarcollectionView)
        
        tabBarcollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - Extensions

extension LookPagingTabBarView {
    func registerCell() {
        LookPagingTabBarCollectionViewCell.register(target: tabBarcollectionView)
        DispatchQueue.main.async {
            let indexPath = IndexPath(item: 0, section: 0)
            self.tabBarcollectionView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredHorizontally)
        }
    }
    
    func setDelegate() {
        tabBarcollectionView.delegate = self
        tabBarcollectionView.dataSource = self
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
