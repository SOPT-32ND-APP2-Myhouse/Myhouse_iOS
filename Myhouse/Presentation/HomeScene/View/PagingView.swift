//
//  PagingView.swift
//  Myhouse
//
//  Created by Kim Min Joo on 2023/05/21.
//

import UIKit
import SnapKit

class PagingView: UIView {
    
    private let categoryTitleList: [String]
    
    private let pagingTabBarView: PagingTabBarView
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: UIScreen.main.bounds.width,
                                height: UIScreen.main.bounds.height)
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.setCollectionViewLayout(layout, animated: false)
        return collectionView
    }()
    
    init(categoryTitleList: [String], pagingTabBarView: PagingTabBarView) {
        self.categoryTitleList = categoryTitleList
        self.pagingTabBarView = pagingTabBarView
        super.init(frame: .zero)
        setDelegate()
        registerCell()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension PagingView {
    func setDelegate() {
        collectionView.dataSource = self
        collectionView.delegate = self
        pagingTabBarView.delegate = self
    }
    
    func registerCell() {
        PagingCollectionViewCell.register(target: collectionView)
    }
    
    func setLayout() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension PagingView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewFrame = collectionView.frame
        return CGSize(width: collectionViewFrame.width, height: collectionViewFrame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let indexPath = IndexPath(row: Int(targetContentOffset.pointee.x / (UIScreen.main.bounds.width-32)), section: 0)
   
        pagingTabBarView.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
    }
}

extension PagingView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryTitleList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = PagingCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
        cell.setupView(title: categoryTitleList[indexPath.row])
        return cell
    }
}

extension PagingView: PagingDelegate {
    func didTapPagingTabBarCell(scrollTo indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
    }
}
