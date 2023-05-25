//
//  LookingPagingView.swift
//  Myhouse
//
//  Created by 최영린 on 2023/05/22.
//

import UIKit

import SnapKit

final class LookingPagingView: BaseView {
    
   // MARK: - UI Components
    
    lazy var pagingTabBar = LookPagingTabBarView()
    
    lazy var contentCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
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
    
    override func setLayout() {
        self.addSubviews(contentCollectionView)
        
        contentCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - Extensions

extension LookingPagingView {
    func registerCell() {
        LookPagingCollectionViewCell.register(target: contentCollectionView)
    }
    
    func setDelegate() {
//        contentCollectionView.delegate = self
        contentCollectionView.dataSource = self
        pagingTabBar.delegate = self
    }
}

extension LookingPagingView: UICollectionViewDelegateFlowLayout {
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
        let indexPath = IndexPath(row: Int(targetContentOffset.pointee.x / UIScreen.main.bounds.width), section: 0)
        pagingTabBar.tabBarcollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
    }
}

extension LookingPagingView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = LookPagingCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
        cell.contentView.addSubview(cell.lookCollectionView)
        return cell
    }
}

extension LookingPagingView: PagingDelegate {
    func didTapPagingTabBarCell(scrollTo indexPath: IndexPath) {
        self.contentCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}
